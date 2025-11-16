// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'http://localhost:4000/api/v1';

  // Auth endpoints
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String googleAuth = '/auth/google';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';
  static const String resendVerification = '/auth/resend-verification';
  static const String mfaVerify = '/auth/mfa/verify';

  // User endpoints
  static const String profile = '/users/profile';
  static const String updateProfile = '/users/profile';
}
