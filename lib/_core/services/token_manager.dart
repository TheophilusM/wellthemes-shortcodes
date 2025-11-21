// Token Manager  
import 'dart:async';
import 'dart:convert';
import 'package:logger/logger.dart';
import '../constants/storage_keys.dart';
import '../../_features/auth/models/jwt_user.dart';
import 'storage_service.dart';

class TokenManager {
  final StorageService _storageService;
  final Logger _logger = Logger();

  String? _accessToken;
  JwtUser? _currentUser;
  Timer? _refreshTimer;
  Future<String?> Function()? onTokenRefreshNeeded;

  TokenManager(this._storageService);

  String? get accessToken => _accessToken;
  JwtUser? get currentUser => _currentUser;
  bool get isAuthenticated => _accessToken != null && _currentUser != null;

  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    await _storageService.writeSecure(StorageKeys.refreshToken, refreshToken);

    _decodeAndSetUser(accessToken);
    _scheduleTokenRefresh(accessToken);
  }

  void _decodeAndSetUser(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token format');
      }

      String payload = parts[1];

      // Add padding if necessary
      switch (payload.length % 4) {
        case 2:
          payload += '==';
          break;
        case 3:
          payload += '=';
          break;
      }

      final normalized = payload.replaceAll('-', '+').replaceAll('_', '/');
      final decoded = utf8.decode(base64.decode(normalized));
      final Map<String, dynamic> payloadMap = json.decode(decoded);

      _currentUser = JwtUser(
        email: payloadMap['sub'] as String,
        fullName: payloadMap['fn'] as String,
        country: payloadMap['country'] as String,
        roles: List<String>.from(payloadMap['roles'] as List),
        mfaEnabled: payloadMap['mid'] as bool,
        userId: payloadMap['id'] as int,
      );

      _logger.d('User decoded from JWT: ${_currentUser?.email}');
    } catch (e) {
      _logger.e('Error decoding JWT token', error: e);
    }
  }

  void _scheduleTokenRefresh(String token) {
    _refreshTimer?.cancel();

    try {
      final expiryDate = extractExpirationDate(token);
      final now = DateTime.now();
      final refreshTime = expiryDate.subtract(const Duration(minutes: 2));

      if (refreshTime.isAfter(now)) {
        final delay = refreshTime.difference(now);
        _logger.d('Scheduling token refresh in ${delay.inMinutes} minutes');

        _refreshTimer = Timer(delay, () {
          _triggerTokenRefresh();
        });
      } else {
        _logger.w('Token expires in less than 2 minutes, refreshing immediately');
        _triggerTokenRefresh();
      }
    } catch (e) {
      _logger.e('Error scheduling token refresh', error: e);
    }
  }

  void _triggerTokenRefresh() {
    _logger.d('Triggering token refresh');
    if (onTokenRefreshNeeded != null) {
      onTokenRefreshNeeded!();
    }
  }

  DateTime extractExpirationDate(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token format');
      }

      String payload = parts[1];

      switch (payload.length % 4) {
        case 2:
          payload += '==';
          break;
        case 3:
          payload += '=';
          break;
      }

      final normalized = payload.replaceAll('-', '+').replaceAll('_', '/');
      final decoded = utf8.decode(base64.decode(normalized));
      final Map<String, dynamic> payloadMap = json.decode(decoded);

      final exp = payloadMap['exp'] as int;
      return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    } catch (e) {
      _logger.e('Error extracting expiration date', error: e);
      return DateTime.now();
    }
  }

  bool isTokenExpired(String token, {int bufferMinutes = 1}) {
    final expiryDate = extractExpirationDate(token);
    final bufferTime = DateTime.now().add(Duration(minutes: bufferMinutes));
    return bufferTime.isAfter(expiryDate);
  }

  Future<String?> getRefreshToken() async {
    return await _storageService.readSecure(StorageKeys.refreshToken);
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    _currentUser = null;
    _refreshTimer?.cancel();
    _refreshTimer = null;
    await _storageService.deleteSecure(StorageKeys.refreshToken);
    _logger.d('Tokens cleared');
  }

  void dispose() {
    _refreshTimer?.cancel();
  }
}