// API Client  
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../exceptions/api_exception.dart';

class ApiClient {
  final Dio _dio;
  final Logger _logger = Logger();

  ApiClient(this._dio);

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      _logger.d('GET $path');
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      _logger.d('POST $path');
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      _logger.d('PUT $path');
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Response> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      _logger.d('DELETE $path');
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    _logger.e('API Error: ${error.type}', error: error);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException('Connection timeout. Please check your internet connection.');

      case DioExceptionType.badResponse:
        return ApiException(
          _extractErrorMessage(error.response),
          error.response?.statusCode,
        );

      case DioExceptionType.connectionError:
        return ApiException('No internet connection. Please check your network settings.');

      case DioExceptionType.cancel:
        return ApiException('Request was cancelled');

      default:
        return ApiException('An unexpected error occurred. Please try again.');
    }
  }

  String _extractErrorMessage(Response? response) {
    try {
      if (response?.data is Map) {
        final data = response!.data as Map<String, dynamic>;
        if (data.containsKey('message')) {
          return data['message'] as String;
        }
      }

      switch (response?.statusCode) {
        case 400:
          return 'Invalid request. Please check your input.';
        case 401:
          return 'Your session has expired. Please log in again.';
        case 403:
          return 'Access denied. You do not have permission to perform this action.';
        case 404:
          return 'The requested resource was not found.';
        case 500:
          return 'Server error. Please try again later.';
        case 503:
          return 'Service temporarily unavailable. Please try again later.';
        default:
          return 'An error occurred (${response?.statusCode ?? 'Unknown'})';
      }
    } catch (e) {
      return 'An error occurred while processing your request.';
    }
  }
}
