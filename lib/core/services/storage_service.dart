// lib/core/services/storage_service.dart
import 'package:wellth/core/constants/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const _keyRefreshToken = '_rt';

  late SharedPreferences _prefs;

  // Refresh Token Logic
  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(
      key: _keyRefreshToken,
      value: token,
      iOptions: const IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _keyRefreshToken);
  }

  Future<String?> getAccessToken() async {
    return await readSecure(StorageKeys.accessToken);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }


  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Secure Storage (for tokens)
  Future<void> writeSecure(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecure(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteSecure(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearSecure() async {
    await _secureStorage.deleteAll();
  }

  // Shared Preferences (for non-sensitive data)
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    await clearSecure();
    return await _prefs.clear();
  }

  // Token management
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await writeSecure(StorageKeys.accessToken, accessToken);
    await writeSecure(StorageKeys.refreshToken, refreshToken);
  }

  Future<void> clearTokens() async {
    await deleteSecure(StorageKeys.accessToken);
    await deleteSecure(StorageKeys.refreshToken);
  }

  // Onboarding state
  bool get isFirstLaunch => getBool(StorageKeys.isFirstLaunch) ?? true;

  Future<void> markFirstLaunchComplete() async {
    await setBool(StorageKeys.isFirstLaunch, false);
  }

  bool get hasCompletedOnboarding =>
      getBool(StorageKeys.hasCompletedOnboarding) ?? false;

  Future<void> markOnboardingComplete() async {
    await setBool(StorageKeys.hasCompletedOnboarding, true);
  }
}
