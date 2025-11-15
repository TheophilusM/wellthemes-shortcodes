import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_api.dart';
import 'package:wellth_app/core/network/dio_provider.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApi(dio);
});
