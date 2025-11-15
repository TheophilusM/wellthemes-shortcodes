import 'package:wellth_app/app/app.dart';
import 'package:wellth_app/core/config/app_environment.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnvironment.init(
    baseUrl: 'https://api.wellth.org',
    environment: Environment.prod,
  );

  runApp(const WellthApp());
}
