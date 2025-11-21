// API Interceptor  
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../services/token_manager.dart';
import '../services/device_info_service.dart';
import '../constants/api_constants.dart';

class ApiInterceptor extends Interceptor {
  final TokenManager _tokenManager;
  final DeviceInfoService _deviceInfoService;
  final Dio _dio;
  final Logger _logger = Logger();
  bool _isRefreshing = false;

  ApiInterceptor(this._tokenManager, this._deviceInfoService, this._dio);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    try {
      // Add device headers to all requests
      final deviceHeaders = await _deviceInfoService.getDeviceHeaders();
      options.headers.addAll(deviceHeaders);

      // Skip token logic for auth endpoints
      if (_isAuthEndpoint(options.path)) {
        return handler.next(options);
      }

      // Check if access token exists
      final accessToken = _tokenManager.accessToken;
      if (accessToken == null) {
        _logger.w('No access token available');
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Authentication required',
            type: DioExceptionType.cancel,
          ),
        );
      }

      // Check if token is expired or expiring soon
      if (_tokenManager.isTokenExpired(accessToken, bufferMinutes: 1)) {
        _logger.d('Token expired or expiring soon, refreshing...');
        final newAccessToken = await _refreshAccessToken();

        if (newAccessToken != null) {
          options.headers['Authorization'] = 'Bearer $newAccessToken';
        } else {
          return handler.reject(
            DioException(
              requestOptions: options,
              error: 'Token refresh failed',
              type: DioExceptionType.cancel,
            ),
          );
        }
      } else {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      return handler.next(options);
    } catch (e) {
      _logger.e('Error in request interceptor', error: e);
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d('Response: ${response.statusCode} ${response.requestOptions.path}');
    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    _logger.e('API Error: ${err.response?.statusCode} ${err.requestOptions.path}');

    // Handle 401 Unauthorized
    if (err.response?.statusCode == 401) {
      // Skip retry for auth endpoints
      if (_isAuthEndpoint(err.requestOptions.path)) {
        return handler.next(err);
      }

      // Attempt token refresh
      final newAccessToken = await _refreshAccessToken();

      if (newAccessToken != null) {
        // Retry the original request with new token
        try {
          final retryOptions = err.requestOptions;
          retryOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          final response = await _dio.fetch(retryOptions);
          return handler.resolve(response);
        } catch (e) {
          _logger.e('Error retrying request', error: e);
        }
      }
    }

    return handler.next(err);
  }

  bool _isAuthEndpoint(String path) {
    final authPaths = [
      ApiConstants.login,
      ApiConstants.register,
      ApiConstants.google,
      ApiConstants.refresh,
      ApiConstants.forgotPassword,
      ApiConstants.resetPassword,
      ApiConstants.verifyEmail,
      ApiConstants.resendVerification,
      ApiConstants.mfaVerify,
    ];
    return authPaths.any((authPath) => path.contains(authPath));
  }

  Future<String?> _refreshAccessToken() async {
    if (_isRefreshing) {
      await Future.delayed(const Duration(seconds: 1));
      return _tokenManager.accessToken;
    }

    _isRefreshing = true;
    try {
      final refreshToken = await _tokenManager.getRefreshToken();
      if (refreshToken == null) {
        _logger.w('No refresh token available');
        return null;
      }

      // Create separate Dio instance to avoid recursion
      final dio = Dio(BaseOptions(
        baseUrl: _dio.options.baseUrl,
        headers: {
          'Accept': '*/*',
          'Cookie': 'refreshToken=$refreshToken',
        },
      ));

      final response = await dio.post(ApiConstants.refresh);

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final newAccessToken = data['accessToken'] as String;
        final newRefreshToken = data['refreshToken'] as String;

        await _tokenManager.setTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        _logger.d('Token refreshed successfully');
        return newAccessToken;
      }
    } catch (e) {
      _logger.e('Token refresh failed', error: e);
    } finally {
      _isRefreshing = false;
    }

    return null;
  }
}
