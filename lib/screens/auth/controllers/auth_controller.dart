import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/services/api_service.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/device_info_service.dart';
import '../../../core/services/storage_service.dart';
import 'auth_state.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
      (ref) {
    return AuthController(ref);
  },
);

class AuthController extends StateNotifier<AuthState> {
  final Ref _ref;
  late final AuthService _authService;
  late final StorageService _storageService;

  // V7: Use GoogleSignIn.instance singleton
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  AuthController(this._ref) : super(const AuthState()) {
    _storageService = _ref.read(storageServiceProvider);
    final deviceInfoService = DeviceInfoService(_storageService);
    final apiService = ApiService(_storageService, deviceInfoService);
    _authService = AuthService(apiService, _storageService);

    _initializeServices();
  }

  Future<void> _initializeServices() async {
    await _initializeGoogleSignIn();
    await _checkAuthStatus();
  }

  // V7: Async initialization required
  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      /*
      await _googleSignIn.initialize(
        clientId: 'YOUR_CLIENT_ID',  // Optional
        serverClientId: 'YOUR_SERVER_CLIENT_ID',  // Optional
      );
       */
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  // V7: Helper to ensure initialization before use
  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  // Check authentication status on app start
  Future<void> _checkAuthStatus() async {
    try {
      final isAuth = await _authService.isAuthenticated();

      if (isAuth) {
        final user = await _authService.getCurrentUser();
        state = AuthState(isAuthenticated: true, user: user);
      }
    } catch (e) {
      await _authService.logout();
      state = const AuthState();
    }
  }

  // Public method to check auth (for router)
  Future<bool> checkAuth() async {
    await _checkAuthStatus();
    return state.isAuthenticated;
  }

  // Register new user
  Future<void> register({
    required String firstName,
    required String surname,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _authService.register(
        firstName: firstName,
        surname: surname,
        email: email,
        password: password,
        referralCode: referralCode,
      );
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // Login with email and password
  Future<void> login({
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final response = await _authService.login(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );

      if (response.requiresMfa) {
        state = state.copyWith(isLoading: false, requiresMfa: true);
      } else if (response.hasTokens) {
        final user = await _authService.getCurrentUser();
        state = AuthState(isAuthenticated: true, user: user, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // V7: Sign in with Google - completely rewritten
  Future<void> signInWithGoogle({bool rememberMe = true}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // Ensure GoogleSignIn is initialized
      await _ensureGoogleSignInInitialized();

      // V7: Check if authenticate() is supported on this platform
      if (!_googleSignIn.supportsAuthenticate()) {
        throw Exception('Google Sign-In not supported on this platform');
      }

      // V7: Use authenticate() instead of signIn()
      // authenticate() throws exceptions instead of returning null
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'profile'],
      );

      // V7: authentication is now synchronous (no await needed)
      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw Exception('Failed to get Google ID token');
      }

      // Send to backend
      final response = await _authService.googleSignIn(
        idToken: idToken,
        rememberMe: rememberMe,
      );

      if (response.requiresMfa) {
        state = state.copyWith(isLoading: false, requiresMfa: true);
      } else if (response.hasTokens) {
        final user = await _authService.getCurrentUser();
        state = AuthState(isAuthenticated: true, user: user, isLoading: false);
      }
    } on GoogleSignInException catch (e) {
      // V7: Handle new exception types
      final errorMessage = _getGoogleSignInErrorMessage(e);
      state = state.copyWith(isLoading: false, error: errorMessage);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // V7: Helper to convert GoogleSignInException to user-friendly messages
  String _getGoogleSignInErrorMessage(GoogleSignInException e) {
    switch (e.code.name) {
      case 'canceled':
        return 'Sign-in was cancelled';
      case 'interrupted':
        return 'Sign-in was interrupted. Please try again.';
      case 'clientConfigurationError':
        return 'Configuration issue with Google Sign-In';
      case 'providerConfigurationError':
        return 'Google Sign-In is currently unavailable';
      case 'uiUnavailable':
        return 'Google Sign-In UI is unavailable';
      case 'userMismatch':
        return 'Account mismatch. Please sign out and try again.';
      default:
        return 'Google Sign-In failed: ${e.description ?? e.code.name}';
    }
  }

  // Verify MFA code
  Future<void> verifyMfa({required String code, bool rememberMe = true}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final response = await _authService.verifyMfa(
        code: code,
        rememberMe: rememberMe,
      );

      if (response.hasTokens) {
        final user = await _authService.getCurrentUser();
        state = AuthState(isAuthenticated: true, user: user, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // Forgot password
  Future<bool> forgotPassword(String email) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _authService.forgotPassword(email);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  // Reset password
  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _authService.resetPassword(token: token, newPassword: newPassword);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  // Verify email
  Future<bool> verifyEmail(String token) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _authService.verifyEmail(token);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  // Resend verification email
  Future<bool> resendVerification(String email) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await _authService.resendVerification(email);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _ensureGoogleSignInInitialized();
      await _googleSignIn.signOut();
    } catch (e) {
      // Ignore Google sign out errors
    }

    await _authService.logout();
    state = const AuthState();
  }

  // Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

// Provider exports
final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('StorageService must be initialized in main.dart');
});