// lib/core/services/auth_service.dart
import 'package:wellth/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import '../models/api_response.dart';
import '../models/user_model.dart';
import 'api_service.dart';
import 'storage_service.dart';

class AuthService {
  final ApiService _apiService;
  final StorageService _storageService;

  AuthService(this._apiService, this._storageService);

  // Register with minimal details
  Future<ApiResponse<void>> register({
    required String firstName,
    required String surname,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    try {
      final response = await _apiService.post(
        ApiConstants.register,
        data: {
          'firstName': firstName,
          'surname': surname,
          'email': email,
          'password': password,
          if (referralCode != null) 'referralCode': referralCode,
        },
      );

      return ApiResponse.fromJson(response.data, null);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Login with email/password
  Future<AuthResponse> login({
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    try {
      final response = await _apiService.post(
        ApiConstants.login,
        data: {'email': email, 'password': password, 'rememberMe': rememberMe},
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (json) => AuthResponse.fromJson(json),
      );

      if (apiResponse.success && apiResponse.data != null) {
        final authData = apiResponse.data!;

        // Save tokens if not MFA
        if (!authData.requiresMfa && authData.hasTokens) {
          await _storageService.saveTokens(
            accessToken: authData.accessToken!,
            refreshToken: authData.refreshToken!,
          );
        }

        return authData;
      }

      throw Exception(apiResponse.message);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Google Sign In
  Future<AuthResponse> googleSignIn({
    required String idToken,
    bool rememberMe = true,
    String? referralCode,
  }) async {
    try {
      final response = await _apiService.post(
        ApiConstants.googleAuth,
        data: {
          'idToken': idToken,
          'rememberMe': rememberMe,
          if (referralCode != null) 'referralCode': referralCode,
        },
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (json) => AuthResponse.fromJson(json),
      );

      if (apiResponse.success && apiResponse.data != null) {
        final authData = apiResponse.data!;

        if (!authData.requiresMfa && authData.hasTokens) {
          await _storageService.saveTokens(
            accessToken: authData.accessToken!,
            refreshToken: authData.refreshToken!,
          );
        }

        return authData;
      }

      throw Exception(apiResponse.message);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Verify MFA code
  Future<AuthResponse> verifyMfa({
    required String code,
    bool rememberMe = true,
  }) async {
    try {
      final response = await _apiService.post(
        ApiConstants.mfaVerify,
        data: {'code': code, 'rememberMe': rememberMe},
      );

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (json) => AuthResponse.fromJson(json),
      );

      if (apiResponse.success && apiResponse.data != null) {
        final authData = apiResponse.data!;

        if (authData.hasTokens) {
          await _storageService.saveTokens(
            accessToken: authData.accessToken!,
            refreshToken: authData.refreshToken!,
          );
        }

        return authData;
      }

      throw Exception(apiResponse.message);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Forgot password
  Future<ApiResponse<void>> forgotPassword(String email) async {
    try {
      final response = await _apiService.post(
        ApiConstants.forgotPassword,
        data: {'email': email},
      );

      return ApiResponse.fromJson(response.data, null);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Reset password
  Future<ApiResponse<void>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      final response = await _apiService.post(
        ApiConstants.resetPassword,
        data: {'token': token, 'newPassword': newPassword},
      );

      return ApiResponse.fromJson(response.data, null);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Verify email
  Future<ApiResponse<void>> verifyEmail(String token) async {
    try {
      final response = await _apiService.get(
        ApiConstants.verifyEmail,
        queryParameters: {'token': token},
      );

      return ApiResponse.fromJson(response.data, null);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Resend verification email
  Future<ApiResponse<void>> resendVerification(String email) async {
    try {
      final response = await _apiService.post(
        ApiConstants.resendVerification,
        data: {'email': email},
      );

      return ApiResponse.fromJson(response.data, null);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get current user profile
  Future<User> getCurrentUser() async {
    try {
      final response = await _apiService.get(ApiConstants.profile);

      final apiResponse = ApiResponse.fromJson(
        response.data,
        (json) => User.fromJson(json),
      );

      if (apiResponse.success && apiResponse.data != null) {
        return apiResponse.data!;
      }

      throw Exception(apiResponse.message);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Logout
  Future<void> logout() async {
    await _storageService.clearTokens();
  }

  // Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final accessToken = await _storageService.getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  String _handleError(DioException error) {
    if (error.response?.data != null) {
      try {
        final errorData = error.response!.data;
        return errorData['message'] ?? 'An error occurred';
      } catch (e) {
        return 'An error occurred';
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badResponse:
        return 'Server error. Please try again later.';
      default:
        return 'An unexpected error occurred.';
    }
  }
}
