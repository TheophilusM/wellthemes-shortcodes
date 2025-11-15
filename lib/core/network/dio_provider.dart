import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wellth_app/core/config/app_environment.dart';
import 'package:wellth_app/core/storage/token_storage.dart';
import 'package:wellth_app/core/storage/token_storage_provider.dart';
import 'package:wellth_app/core/utils/device_info_provider.dart';
import 'package:wellth_app/core/network/logout_callback_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  final deviceInfo = ref.watch(deviceInfoProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: AppEnvironment.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Attach device context on every request
        final headers = await deviceInfo.getHeaders();
        options.headers.addAll(headers);

        // Attach access token unless explicitly disabled
        final useAccessToken = options.extra['useAccessToken'] != false;
        if (useAccessToken) {
          final accessToken = await tokenStorage.getAccessToken();
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
        }

        return handler.next(options);
      },
      onError: (error, handler) async {
        final request = error.requestOptions;
        final status = error.response?.statusCode;

        final alreadyRetried = request.extra['retry'] == true;
        final shouldTryRefresh = _shouldAttemptRefresh(request.path);

        if (status != 401 || alreadyRetried || !shouldTryRefresh) {
          return handler.next(error);
        }

        final refreshedResponse = await _refreshTokenAndRetry(
          dio: dio,
          tokenStorage: tokenStorage,
          ref: ref,
          originalRequest: request,
        );

        if (refreshedResponse != null) {
          return handler.resolve(refreshedResponse);
        }

        // Refresh failed – propagate original error
        return handler.next(error);
      },
    ),
  );

  return dio;
});

bool _shouldAttemptRefresh(String path) {
  // Don’t try refresh for auth endpoints themselves
  const authPaths = [
    '/auth/login',
    '/auth/register',
    '/auth/refresh',
    '/auth/mfa/verify',
    '/auth/google',
    '/auth/forgot-password',
    '/auth/reset-password',
    '/auth/verify-email',
    '/auth/resend-verification',
  ];
  return !authPaths.contains(path);
}

Future<Response<dynamic>?> _refreshTokenAndRetry({
  required Dio dio,
  required TokenStorage tokenStorage,
  required Ref ref,
  required RequestOptions originalRequest,
}) async {
  final refreshToken = await tokenStorage.getRefreshToken();
  if (refreshToken == null || refreshToken.isEmpty) {
    await _performLogout(ref, tokenStorage);
    return null;
  }

  try {
    // Call /auth/refresh with refresh token in Authorization header
    final refreshResponse = await dio.post(
      '/auth/refresh',
      options: Options(
        extra: {'useAccessToken': false, 'retry': true},
        headers: {'Authorization': 'Bearer $refreshToken'},
      ),
    );

    final body = refreshResponse.data as Map<String, dynamic>;
    final data = (body['data'] ?? {}) as Map<String, dynamic>;

    final newAccess = data['accessToken'] as String?;
    final newRefresh = data['refreshToken'] as String?;

    if (newAccess == null || newRefresh == null) {
      await _performLogout(ref, tokenStorage);
      return null;
    }

    await tokenStorage.saveTokens(
      accessToken: newAccess,
      refreshToken: newRefresh,
    );

    final newOptions = Options(
      method: originalRequest.method,
      headers: originalRequest.headers,
      extra: {...originalRequest.extra, 'retry': true},
      responseType: originalRequest.responseType,
      contentType: originalRequest.contentType,
      followRedirects: originalRequest.followRedirects,
      validateStatus: originalRequest.validateStatus,
      receiveDataWhenStatusError: originalRequest.receiveDataWhenStatusError,
    );

    final clonedResponse = await dio.request(
      originalRequest.path,
      data: originalRequest.data,
      queryParameters: originalRequest.queryParameters,
      options: newOptions,
    );

    return clonedResponse;
  } catch (_) {
    await _performLogout(ref, tokenStorage);
    return null;
  }
}

Future<void> _performLogout(Ref ref, TokenStorage tokenStorage) async {
  final callback = ref.read(logoutCallbackProvider);
  if (callback != null) {
    await callback();
  } else {
    await tokenStorage.clear();
  }
}
