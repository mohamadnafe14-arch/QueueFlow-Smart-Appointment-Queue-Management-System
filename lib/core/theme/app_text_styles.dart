import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'Inter';
  static const String monoFontFamily = 'JetBrains Mono';

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: -0.5,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      height: 38 / 30,
      letterSpacing: -0.25,
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.25,
      letterSpacing: -0.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 4 / 3,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 26 / 18,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 4 / 3,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 20 / 14,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 4 / 3,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      height: 14 / 11,
    ),
  );

  static const TextStyle ticket = TextStyle(
    fontFamily: monoFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 4 / 3,
    letterSpacing: 1,
  );
}
