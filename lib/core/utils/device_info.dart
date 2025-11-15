import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoService {
  static const _deviceIdKey = 'device_id';
  String? _deviceId;
  Map<String, String>? _cachedHeaders;

  Future<Map<String, String>> getHeaders() async {
    if (_cachedHeaders != null) return _cachedHeaders!;

    final deviceId = await _ensureDeviceId();
    final deviceInfoPlugin = DeviceInfoPlugin();

    String platform = 'Unknown';
    String osVersion = 'Unknown';
    String deviceModel = 'Unknown';

    if (kIsWeb) {
      platform = 'Web';
      final webInfo = await deviceInfoPlugin.webBrowserInfo;
      osVersion = webInfo.userAgent ?? 'Unknown';
      deviceModel = webInfo.browserName.name;
    } else if (Platform.isAndroid) {
      platform = 'Android';
      final info = await deviceInfoPlugin.androidInfo;
      osVersion = info.version.release;
      deviceModel = '${info.manufacturer} ${info.model}';
    } else if (Platform.isIOS) {
      platform = 'iOS';
      final info = await deviceInfoPlugin.iosInfo;
      osVersion = info.systemVersion;
      deviceModel = info.utsname.machine;
    }

    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version;

    _cachedHeaders = {
      'X-Device-ID': deviceId,
      'X-Platform': platform,
      'X-OS-Version': osVersion,
      'X-App-Version': appVersion,
      'X-Device-Model': deviceModel,
    };

    return _cachedHeaders!;
  }

  Future<String> _ensureDeviceId() async {
    if (_deviceId != null) return _deviceId!;
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_deviceIdKey);
    if (saved != null) {
      _deviceId = saved;
      return saved;
    }
    final newId = const Uuid().v4();
    await prefs.setString(_deviceIdKey, newId);
    _deviceId = newId;
    return newId;
  }
}
