// API Constants
class ApiConstants {
  // static const String baseUrl = 'http://localhost:4000';
  static const String baseUrl = 'http://192.168.8.112:4000';
  static const String apiVersion = '/api/v1';

  // Auth endpoints
  static const String login = '$apiVersion/auth/login';
  static const String register = '$apiVersion/auth/register';
  static const String google = '$apiVersion/auth/google';
  static const String refresh = '$apiVersion/auth/refresh';
  static const String verifyEmail = '$apiVersion/auth/verify-email';
  static const String resendVerification =
      '$apiVersion/auth/resend-verification';
  static const String forgotPassword = '$apiVersion/auth/forgot-password';
  static const String resetPassword = '$apiVersion/auth/reset-password';
  static const String mfaVerify = '$apiVersion/auth/mfa/verify';

  // User endpoints
  static const String profile = '$apiVersion/user/profile';
}
