import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../_core/constants/storage_keys.dart';
import '../../../_core/services/storage_service.dart';
import '../../../_core/services/token_manager.dart';
import '../models/auth_request.dart';
import '../models/auth_state.dart';
import '../models/user_profile.dart';
import '../services/auth_service.dart';

// Provider definitions for dependencies
final authServiceProvider = Provider<AuthService>((ref) {
  throw UnimplementedError('Override this provider');
});

final tokenManagerProvider = Provider<TokenManager>((ref) {
  throw UnimplementedError('Override this provider');
});

final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('Override this provider');
});

// Main AuthController provider
final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends Notifier<AuthState> {
  final Logger _logger = Logger();

  // Late initialized dependencies - set in build()
  late final AuthService _authService;
  late final TokenManager _tokenManager;
  late final StorageService _storageService;

  @override
  AuthState build() {
    // Initialize dependencies in build() - this is when ref is safe to use
    _authService = ref.read(authServiceProvider);
    _tokenManager = ref.read(tokenManagerProvider);
    _storageService = ref.read(storageServiceProvider);

    // Set up token refresh callback
    _tokenManager.onTokenRefreshNeeded = _performTokenRefresh;

    // Initialize asynchronously
    _initialize();

    // Return initial state
    return const AuthState(isInitializing: true);
  }

  Future<void> _initialize() async {
    _logger.d('Initializing AuthController');

    final refreshToken = await _tokenManager.getRefreshToken();

    if (refreshToken != null) {
      _logger.d('Found existing refresh token, attempting silent login');
      await _attemptSilentLogin();
    } else {
      _logger.d('No refresh token found');
      state = state.copyWith(isInitializing: false);
    }
  }

  Future<void> _attemptSilentLogin() async {
    try {
      state = state.copyWith(isInitializing: true);

      final response = await _authService.refreshToken();

      if (response.data.accessToken != null && response.data.refreshToken != null) {
        await _tokenManager.setTokens(
          accessToken: response.data.accessToken!,
          refreshToken: response.data.refreshToken!,
        );

        state = state.copyWith(
          isAuthenticated: true,
          isInitializing: false,
          user: _tokenManager.currentUser,
        );

        _logger.d('Silent login successful');
      } else {
        throw Exception('Invalid token response');
      }
    } catch (e) {
      _logger.e('Silent login failed', error: e);
      await logout();
      state = state.copyWith(isInitializing: false);
    }
  }

  Future<String?> _performTokenRefresh() async {
    try {
      _logger.d('Performing token refresh');
      final response = await _authService.refreshToken();

      if (response.data.accessToken != null && response.data.refreshToken != null) {
        await _tokenManager.setTokens(
          accessToken: response.data.accessToken!,
          refreshToken: response.data.refreshToken!,
        );

        return response.data.accessToken;
      }
    } catch (e) {
      _logger.e('Token refresh failed', error: e);
      await logout();
    }
    return null;
  }

  Future<void> register(RegisterRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.register(request);

      await _storageService.write(StorageKeys.userEmail, request.email);

      state = state.copyWith(isLoading: false, error: null);

      _logger.d('Registration successful: ${response.message}');
    } catch (e) {
      _logger.e('Registration failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> login(LoginRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.login(request);

      if (response.data.requiresMfa) {
        state = state.copyWith(isLoading: false, requiresMfa: true);
        return;
      }

      if (response.data.accessToken != null && response.data.refreshToken != null) {
        await _tokenManager.setTokens(
          accessToken: response.data.accessToken!,
          refreshToken: response.data.refreshToken!,
        );

        await _storageService.write(StorageKeys.userEmail, request.email);

        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          user: _tokenManager.currentUser,
          requiresMfa: false,
        );

        _logger.d('Login successful');
      }
    } catch (e) {
      _logger.e('Login failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> loginWithGoogle(GoogleLoginRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.loginWithGoogle(request);

      if (response.data.requiresMfa) {
        state = state.copyWith(isLoading: false, requiresMfa: true);
        return;
      }

      if (response.data.accessToken != null && response.data.refreshToken != null) {
        await _tokenManager.setTokens(
          accessToken: response.data.accessToken!,
          refreshToken: response.data.refreshToken!,
        );

        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          user: _tokenManager.currentUser,
          requiresMfa: false,
        );

        _logger.d('Google login successful');
      }
    } catch (e) {
      _logger.e('Google login failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> verifyMfa(MfaVerificationRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.verifyMfa(request);

      if (response.data.accessToken != null && response.data.refreshToken != null) {
        await _tokenManager.setTokens(
          accessToken: response.data.accessToken!,
          refreshToken: response.data.refreshToken!,
        );

        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          user: _tokenManager.currentUser,
          requiresMfa: false,
        );

        _logger.d('MFA verification successful');
      }
    } catch (e) {
      _logger.e('MFA verification failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> verifyEmail(String token) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.verifyEmail(token);

      state = state.copyWith(isLoading: false);

      _logger.d('Email verification successful: ${response.message}');
    } catch (e) {
      _logger.e('Email verification failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> resendVerification(String email) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.resendVerification(email);

      state = state.copyWith(isLoading: false);

      _logger.d('Verification email resent: ${response.message}');
    } catch (e) {
      _logger.e('Resend verification failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.forgotPassword(request);

      state = state.copyWith(isLoading: false);

      _logger.d('Password reset email sent: ${response.message}');
    } catch (e) {
      _logger.e('Forgot password failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await _authService.resetPassword(request);

      state = state.copyWith(isLoading: false);

      _logger.d('Password reset successful: ${response.message}');
    } catch (e) {
      _logger.e('Password reset failed', error: e);
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<UserProfile?> fetchProfile() async {
    try {
      final profile = await _authService.getProfile();
      _logger.d('Profile fetched: ${profile.email}');
      return profile;
    } catch (e) {
      _logger.e('Fetch profile failed', error: e);
      return null;
    }
  }

  Future<void> logout() async {
    await _tokenManager.clearTokens();
    await _storageService.delete(StorageKeys.userEmail);
    state = const AuthState();
    _logger.d('User logged out');
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}