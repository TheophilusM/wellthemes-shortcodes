// Auth Service  
import 'package:logger/logger.dart';
import '../../../_core/network/api_client.dart';
import '../../../_core/constants/api_constants.dart';
import '../models/auth_request.dart';
import '../models/auth_response.dart';
import '../models/user_profile.dart';

class AuthService {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  AuthService(this._apiClient);

  Future<ApiResponse> register(RegisterRequest request) async {
    _logger.d('Registering user: ${request.email}');
    final response = await _apiClient.post(
      ApiConstants.register,
      data: request.toJson(),
    );
    return ApiResponse.fromJson(response.data);
  }

  Future<AuthResponse> login(LoginRequest request) async {
    _logger.d('Logging in user: ${request.email}');
    final response = await _apiClient.post(
      ApiConstants.login,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> loginWithGoogle(GoogleLoginRequest request) async {
    _logger.d('Logging in with Google');
    final response = await _apiClient.post(
      ApiConstants.google,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> verifyMfa(MfaVerificationRequest request) async {
    _logger.d('Verifying MFA code');
    final response = await _apiClient.post(
      ApiConstants.mfaVerify,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> refreshToken() async {
    _logger.d('Refreshing token');
    final response = await _apiClient.post(ApiConstants.refresh);
    return AuthResponse.fromJson(response.data);
  }

  Future<ApiResponse> verifyEmail(String token) async {
    _logger.d('Verifying email');
    final response = await _apiClient.get(
      ApiConstants.verifyEmail,
      queryParameters: {'token': token},
    );
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> resendVerification(String email) async {
    _logger.d('Resending verification email: $email');
    final response = await _apiClient.post(
      ApiConstants.resendVerification,
      data: {'email': email},
    );
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> forgotPassword(ForgotPasswordRequest request) async {
    _logger.d('Requesting password reset: ${request.email}');
    final response = await _apiClient.post(
      ApiConstants.forgotPassword,
      data: request.toJson(),
    );
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse> resetPassword(ResetPasswordRequest request) async {
    _logger.d('Resetting password');
    final response = await _apiClient.post(
      ApiConstants.resetPassword,
      data: request.toJson(),
    );
    return ApiResponse.fromJson(response.data);
  }

  Future<UserProfile> getProfile() async {
    _logger.d('Fetching user profile');
    final response = await _apiClient.get(ApiConstants.profile);
    return UserProfile.fromJson(response.data);
  }
}
