// Global Providers - Migrated to Riverpod 3.0
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/storage_service.dart';
import '../services/token_manager.dart';
import '../services/device_info_service.dart';
import '../network/api_client.dart';
import '../network/api_interceptor.dart';
import '../constants/api_constants.dart';
import '../../_features/auth/services/auth_service.dart';
import '../../_features/auth/controllers/auth_controller.dart';
import '../../_features/auth/models/auth_state.dart';
import '../../_features/auth/models/jwt_user.dart';

// Infrastructure Providers
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main()');
});

final baseUrlProvider = Provider<String>((ref) {
  return ApiConstants.baseUrl;
});

// Core Service Providers
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(
    ref.watch(secureStorageProvider),
    ref.watch(sharedPreferencesProvider),
  );
});

final tokenManagerProvider = Provider<TokenManager>((ref) {
  return TokenManager(ref.watch(storageServiceProvider));
});

final deviceInfoServiceProvider = Provider<DeviceInfoService>((ref) {
  return DeviceInfoService(ref.watch(storageServiceProvider));
});

// Network Providers
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ref.watch(baseUrlProvider),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {'Content-Type': 'application/json', 'Accept': '*/*'},
    ),
  );

  dio.interceptors.add(
    ApiInterceptor(
      ref.watch(tokenManagerProvider),
      ref.watch(deviceInfoServiceProvider),
      dio,
    ),
  );

  return dio;
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});

// Feature Providers
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(apiClientProvider));
});

// CHANGED: StateNotifierProvider -> NotifierProvider
final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

// Computed Providers (unchanged - these work the same)
final currentUserProvider = Provider<JwtUser?>((ref) {
  return ref.watch(authControllerProvider).user;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isAuthenticated;
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isLoading;
});

final isInitializingProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isInitializing;
});

final requiresMfaProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).requiresMfa;
});
