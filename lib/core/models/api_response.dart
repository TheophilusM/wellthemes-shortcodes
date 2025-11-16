// lib/core/models/api_response.dart
class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final int? timestamp;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.timestamp,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic)? fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'],
      timestamp: json['timestamp'],
    );
  }
}

class AuthResponse {
  final bool requiresMfa;
  final String? accessToken;
  final String? refreshToken;

  AuthResponse({
    required this.requiresMfa,
    this.accessToken,
    this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      requiresMfa: json['requiresMfa'] ?? false,
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  bool get hasTokens => accessToken != null && refreshToken != null;
}
