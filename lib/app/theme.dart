import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WellthColors {
  static const primary = Color(0xFF005F8D);
  static const gradientFrom = Color(0xFF0077B6);

  static const background = Color(0xFFF5F5F5);
  static const seedColor = Color(0xFF2196F3);
  static const secondary = Color(0xFF64B5F6);
  static const surface = Colors.white;
}

ThemeData buildWellthTheme() {
  final base = ThemeData(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      surface: Colors.white,
      primary: WellthColors.primary,
      secondary: WellthColors.secondary,
    ),
    scaffoldBackgroundColor: WellthColors.background,
    // textTheme: GoogleFonts.robotoTextTheme(base.textTheme),
    // textTheme: GoogleFonts.openSansTextTheme(base.textTheme),
    textTheme: GoogleFonts.latoTextTheme(base.textTheme),
    // textTheme: GoogleFonts.interTextTheme(base.textTheme),
  );
}
