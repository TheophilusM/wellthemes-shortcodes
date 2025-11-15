import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellth_app/features/auth/data/auth_api_provider.dart';

import '../domain/auth_state.dart';
import '../../auth/data/auth_api.dart';
import '../../auth/data/auth_models.dart';
import '../../../core/storage/token_storage_provider.dart';
import '../../../core/storage/token_storage.dart';
import '../../../core/network/logout_callback_provider.dart';

enum LoginOutcome { success, requiresMfa }

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final tokenStorage = ref.watch(tokenStorageProvider);
    final authApi = ref.watch(authApiProvider);

    final controller = AuthController(tokenStorage, authApi);

    // Register logout callback for the network layer (refresh failure, etc.)
    ref.read(logoutCallbackProvider.notifier).state =
        controller.logoutFromNetwork;

    controller.init();
    return controller;
  },
);

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._tokenStorage, this._authApi) : super(AuthState.initial);

  final TokenStorage _tokenStorage;
  final AuthApi _authApi;

  final _streamController = StreamController<AuthState>.broadcast();
  Stream<AuthState> get stream => _streamController.stream;

  // ---------- STARTUP ----------

  Future<void> init() async {
    final firstLaunch = await _tokenStorage.isFirstLaunch();
    final access = await _tokenStorage.getAccessToken();
    final refresh = await _tokenStorage.getRefreshToken();

    if (access != null && refresh != null) {
      state = state.copyWith(
        status: AuthStatus.authenticated,
        isFirstLaunch: false,
        isProfileComplete: true,
      );
    } else {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isFirstLaunch: firstLaunch,
      );
    }

    _streamController.add(state);
  }

  // ---------- AUTH ACTIONS ----------

  Future<LoginOutcome> login({
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    final result = await _authApi.login(
      LoginRequest(email: email, password: password, rememberMe: rememberMe),
    );

    if (result.requiresMfa) {
      // Stay unauthenticated; MFA screen will complete login.
      return LoginOutcome.requiresMfa;
    }

    final access = result.accessToken;
    final refresh = result.refreshToken;
    if (access == null || refresh == null) {
      throw Exception('Login response did not contain tokens');
    }

    await _completeAuthentication(access, refresh);
    return LoginOutcome.success;
  }

  Future<void> verifyMfa({required String code, bool rememberMe = true}) async {
    final result = await _authApi.verifyMfa(
      MfaVerifyRequest(code: code, rememberMe: rememberMe),
    );

    final access = result.accessToken;
    final refresh = result.refreshToken;
    if (access == null || refresh == null) {
      throw Exception('MFA verification did not return tokens');
    }

    await _completeAuthentication(access, refresh);
  }

  Future<void> register({
    required String firstName,
    required String surname,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    await _authApi.register(
      RegisterRequest(
        firstName: firstName,
        surname: surname,
        email: email,
        password: password,
        referralCode: referralCode,
      ),
    );
    // After register, user will login normally.
  }

  Future<void> logout() async => _logoutInternal();

  // Called by network layer when refresh fails
  Future<void> logoutFromNetwork() async => _logoutInternal();

  // ---------- HELPERS ----------

  Future<void> _completeAuthentication(
    String accessToken,
    String refreshToken,
  ) async {
    await _tokenStorage.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    await _tokenStorage.setFirstLaunchDone();

    state = state.copyWith(
      status: AuthStatus.authenticated,
      isFirstLaunch: false,
      isProfileComplete: true,
    );
    _streamController.add(state);
  }

  Future<void> _logoutInternal() async {
    await _tokenStorage.clear();
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      isFirstLaunch: false,
      isProfileComplete: false,
    );
    _streamController.add(state);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
