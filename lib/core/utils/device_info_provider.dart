// lib/core/utils/device_info_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'device_info.dart';

final deviceInfoProvider = Provider<DeviceInfoService>((ref) {
  return DeviceInfoService();
});
