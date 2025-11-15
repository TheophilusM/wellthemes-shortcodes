import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/config/app_environment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnvironment.init(
    baseUrl: 'http://localhost:4000//api/v1', // your dev URL
    environment: Environment.dev,
  );

  runApp(const ProviderScope(child: WellthApp()));
}
