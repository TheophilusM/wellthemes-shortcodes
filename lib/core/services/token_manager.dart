import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wellth/core/constants/storage_keys.dart';
import 'package:wellth/core/services/storage_service.dart';

import '../../_features/auth/models/jwt_user.dart';

class TokenManager {
  final StorageService _storageService;
  final Logger _logger = Logger();

  // In-memory token storage (private)
  String? _accessToken;
  JwtUser? _currentUser;
  Timer? _refreshTimer;

  // Callback for token refresh
  Future<String?> Function()? onTokenRefreshNeeded;

  TokenManager(this._storageService);

  // ========== TOKEN GETTERS ==========

  String? get accessToken => _accessToken;
  JwtUser? get currentUser => _currentUser;
  bool get isAuthenticated => _accessToken != null && _currentUser != null;

  // ========== TOKEN MANAGEMENT ==========

  /// Sets tokens and user info after successful authentication
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      // Store access token in memory
      _accessToken = accessToken;

      // Store refresh token securely
      await _storageService.writeSecure(StorageKeys.refreshToken, refreshToken);

      // Decode and set user info
      final user = _decodeAccessToken(accessToken);
      if (user != null) {
        _currentUser = user;
        await _storageService.writeSecure(StorageKeys.userEmail, user.email);
        _logger.i('Tokens set successfully for user: ${user.email}');

        // Start auto-refresh timer
        _scheduleTokenRefresh(accessToken);
      } else {
        _logger.e('Failed to decode access token');
      }
    } catch (e) {
      _logger.e('Error setting tokens', error: e);
      rethrow;
    }
  }

  /// Updates only the access token (used during refresh)
  Future<void> updateAccessToken(String accessToken) async {
    try {
      _accessToken = accessToken;

      // Update user info from new token
      final user = _decodeAccessToken(accessToken);
      if (user != null) {
        _currentUser = user;
        _logger.i('Access token updated for user: ${user.email}');

        // Reschedule refresh timer
        _scheduleTokenRefresh(accessToken);
      }
    } catch (e) {
      _logger.e('Error updating access token', error: e);
      rethrow;
    }
  }

  /// Retrieves the stored refresh token
  Future<String?> getRefreshToken() async {
    try {
      return await _storageService.readSecure(StorageKeys.refreshToken);
    } catch (e) {
      _logger.e('Error retrieving refresh token', error: e);
      return null;
    }
  }

  /// Clears all tokens and user data
  Future<void> clearTokens() async {
    try {
      _accessToken = null;
      _currentUser = null;
      _refreshTimer?.cancel();
      _refreshTimer = null;

      await _storageService.deleteSecure(StorageKeys.refreshToken);
      await _storageService.deleteSecure(StorageKeys.userEmail);

      _logger.i('All tokens cleared');
    } catch (e) {
      _logger.e('Error clearing tokens', error: e);
      rethrow;
    }
  }

  /// Checks if token is expired or about to expire
  bool isTokenExpired(String token, {int bufferMinutes = 1}) {
    try {
      final payload = _decodeJwtPayload(token);
      if (payload == null) return true;

      final exp = payload['exp'] as int?;
      if (exp == null) return true;

      final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final now = DateTime.now();
      final bufferTime = now.add(Duration(minutes: bufferMinutes));

      return bufferTime.isAfter(expiryDate);
    } catch (e) {
      _logger.e('Error checking token expiration', error: e);
      return true;
    }
  }

  // ========== AUTO-REFRESH LOGIC ==========

  /// Schedules automatic token refresh before expiration
  void _scheduleTokenRefresh(String accessToken) {
    _refreshTimer?.cancel();

    try {
      final payload = _decodeJwtPayload(accessToken);
      if (payload == null) return;

      final exp = payload['exp'] as int?;
      if (exp == null) return;

      final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final now = DateTime.now();

      // Schedule refresh 2 minutes before expiration
      final refreshTime = expiryDate.subtract(const Duration(minutes: 2));
      final delay = refreshTime.difference(now);

      if (delay.isNegative) {
        // Token already expired or about to expire, refresh immediately
        _logger.w('Token expires soon, refreshing immediately');
        _triggerTokenRefresh();
        return;
      }

      _logger.d('Scheduling token refresh in ${delay.inMinutes} minutes');

      _refreshTimer = Timer(delay, () {
        _logger.i('Auto-refreshing token');
        _triggerTokenRefresh();
      });
    } catch (e) {
      _logger.e('Error scheduling token refresh', error: e);
    }
  }

  /// Triggers the token refresh callback
  void _triggerTokenRefresh() async {
    if (onTokenRefreshNeeded != null) {
      try {
        final newAccessToken = await onTokenRefreshNeeded!();
        if (newAccessToken != null) {
          await updateAccessToken(newAccessToken);
          _logger.i('Token auto-refresh successful');
        } else {
          _logger.w('Token refresh returned null');
        }
      } catch (e) {
        _logger.e('Error during auto-refresh', error: e);
      }
    } else {
      _logger.w('No token refresh callback registered');
    }
  }

  // ========== JWT DECODING ==========

  /// Decodes JWT payload
  Map<String, dynamic>? _decodeJwtPayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      // Decode the payload (second part)
      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      return json.decode(decoded) as Map<String, dynamic>;
    } catch (e) {
      _logger.e('Error decoding JWT payload', error: e);
      return null;
    }
  }

  /// Decodes access token and extracts user info
  JwtUser? _decodeAccessToken(String token) {
    try {
      final payload = _decodeJwtPayload(token);
      if (payload == null) return null;

      return JwtUser(
        email: payload['sub'] as String,
        fullName: payload['fn'] as String,
        country: payload['country'] as String,
        roles: (payload['roles'] as List<dynamic>).cast<String>(),
        mfaEnabled: payload['mid'] as bool,
        userId: payload['id'] as int,
      );
    } catch (e) {
      _logger.e('Error decoding access token', error: e);
      return null;
    }
  }

  /// Cleanup method
  void dispose() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }
}