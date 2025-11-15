import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef LogoutCallback = Future<void> Function();

final logoutCallbackProvider = StateProvider<LogoutCallback?>((ref) => null);
