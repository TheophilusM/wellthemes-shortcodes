// lib/core/services/device_info_service.dart
import 'dart:io';
import 'package:wellth/core/constants/storage_keys.dart';
import 'package:wellth/core/services/storage_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  final StorageService _storageService;

  DeviceInfoService(this._storageService);

  Future<Map<String, String>> getDeviceHeaders() async {
    final deviceId = await _getOrCreateDeviceId();
    final platform = Platform.isAndroid ? 'Android' : 'iOS';
    final osVersion = await _getOSVersion();
    final appVersion = await _getAppVersion();
    final deviceModel = await _getDeviceModel();

    return {
      'X-Device-ID': deviceId,
      'X-Platform': platform,
      'X-OS-Version': osVersion,
      'X-App-Version': appVersion,
      'X-Device-Model': deviceModel,
    };
  }

  Future<String> _getOrCreateDeviceId() async {
    String? deviceId = await _storageService.readSecure(StorageKeys.deviceId);

    if (deviceId == null || deviceId.isEmpty) {
      deviceId = const Uuid().v4();
      await _storageService.writeSecure(StorageKeys.deviceId, deviceId);
    }

    return deviceId;
  }

  Future<String> _getOSVersion() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        return androidInfo.version.release;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.systemVersion;
      }
    } catch (e) {
      return 'Unknown';
    }
    return 'Unknown';
  }

  Future<String> _getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return '${packageInfo.version}+${packageInfo.buildNumber}';
    } catch (e) {
      return '1.0.0';
    }
  }

  Future<String> _getDeviceModel() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        return '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.model;
      }
    } catch (e) {
      return 'Unknown';
    }
    return 'Unknown';
  }
}
