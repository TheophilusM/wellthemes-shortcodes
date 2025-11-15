import 'package:dio/dio.dart';

import 'auth_models.dart';

class AuthApi {
  AuthApi(this._dio);

  final Dio _dio;

  // ----- HELPERS -----

  LoginResult _parseLoginResult(dynamic json) {
    final map = json as Map<String, dynamic>;
    final data = (map['data'] ?? {}) as Map<String, dynamic>;
    return LoginResult(
      requiresMfa: data['requiresMfa'] as bool? ?? false,
      accessToken: data['accessToken'] as String?,
      refreshToken: data['refreshToken'] as String?,
    );
  }

  AuthTokens _parseTokens(dynamic json) {
    final map = json as Map<String, dynamic>;
    final data = (map['data'] ?? {}) as Map<String, dynamic>;
    return AuthTokens(
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String,
    );
  }

  // ----- ENDPOINTS -----

  Future<LoginResult> login(LoginRequest request) async {
    final response = await _dio.post(
      '/auth/login',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
    return _parseLoginResult(response.data);
  }

  Future<void> register(RegisterRequest request) async {
    await _dio.post(
      '/auth/register',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
  }

  Future<LoginResult> verifyMfa(MfaVerifyRequest request) async {
    final response = await _dio.post(
      '/auth/mfa/verify',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
    return _parseLoginResult(response.data);
  }

  Future<AuthTokens> refresh(String refreshToken) async {
    final response = await _dio.post(
      '/auth/refresh',
      options: Options(
        extra: {'useAccessToken': false, 'retry': true},
        headers: {'Authorization': 'Bearer $refreshToken'},
      ),
    );
    return _parseTokens(response.data);
  }

  Future<LoginResult> googleLogin(GoogleLoginRequest request) async {
    final response = await _dio.post(
      '/auth/google',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
    return _parseLoginResult(response.data);
  }

  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    await _dio.post(
      '/auth/forgot-password',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    await _dio.post(
      '/auth/reset-password',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
  }

  Future<void> resendVerification(ResendVerificationRequest request) async {
    await _dio.post(
      '/auth/resend-verification',
      data: request.toJson(),
      options: Options(extra: {'useAccessToken': false}),
    );
  }

  Future<void> verifyEmail(String token) async {
    await _dio.get(
      '/auth/verify-email',
      queryParameters: {'token': token},
      options: Options(extra: {'useAccessToken': false}),
    );
  }
}
