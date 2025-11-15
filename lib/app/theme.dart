import 'package:flutter/material.dart';

class WellthColors {
  static const primary = Color(0xFF0066FF); // TODO: replace with Figma values
  static const background = Color(0xFFF5F5F5);
}

ThemeData buildWellthTheme() {
  final base = ThemeData(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: WellthColors.primary,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: WellthColors.background,
  );
}
