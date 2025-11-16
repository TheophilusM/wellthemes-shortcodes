import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/services/device_info_service.dart';
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
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  AuthController(this._ref) : super(const AuthState()) {
    _storageService = _ref.read(storageServiceProvider);
    final deviceInfoService = DeviceInfoService(_storageService);
    final apiService = ApiService(_storageService, deviceInfoService);
    _authService = AuthService(apiService, _storageService);

    _checkAuthStatus();
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
      // If token validation fails, clear tokens
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

      // Registration successful - email verification required
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
        // MFA required
        state = state.copyWith(isLoading: false, requiresMfa: true);
      } else if (response.hasTokens) {
        // Login successful - fetch user profile
        final user = await _authService.getCurrentUser();
        state = AuthState(isAuthenticated: true, user: user, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle({bool rememberMe = true}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // Initiate Google Sign In
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in
        state = state.copyWith(isLoading: false);
        return;
      }

      // Get authentication
      final googleAuth = await googleUser.authentication;
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
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
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
// Storage service will be initialized in main.dart and overridden
final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('StorageService must be initialized in main.dart');
});
