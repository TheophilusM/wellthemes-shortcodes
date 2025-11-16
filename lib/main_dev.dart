import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/config/app_environment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnvironment.init(
    baseUrl: 'http://192.168.8.112:4000/api/v1',
    environment: Environment.dev,
  );

  runApp(const ProviderScope(child: WellthApp()));
}
