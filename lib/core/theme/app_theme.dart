import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData light = _buildTheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    surfaceVariant: AppColors.lightSurfaceVariant,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    outline: AppColors.lightOutline,
    error: AppColors.lightError,
    shadow: AppColors.lightShadow,
  );

  static final ThemeData dark = _buildTheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    surfaceVariant: AppColors.darkSurfaceVariant,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    outline: AppColors.darkOutline,
    error: AppColors.darkError,
    shadow: AppColors.darkShadow,
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color onPrimary,
    required Color secondary,
    required Color onSecondary,
    required Color background,
    required Color surface,
    required Color surfaceVariant,
    required Color textPrimary,
    required Color textSecondary,
    required Color outline,
    required Color error,
    required Color shadow,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      surface: surface,
      onSurface: textPrimary,
      error: error,
      onError: onPrimary,
      outline: outline,
      outlineVariant: outline,
    );
    final textTheme = AppTextStyles.textTheme.apply(
      bodyColor: textPrimary,
      displayColor: textPrimary,
    );
    final fieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadii.medium),
      borderSide: BorderSide(color: outline),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      fontFamily: AppTextStyles.fontFamily,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: IconThemeData(color: textPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          disabledBackgroundColor: surfaceVariant,
          disabledForegroundColor: textSecondary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.regular),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          side: BorderSide(color: outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.regular),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(color: textSecondary),
        labelStyle: textTheme.bodyMedium?.copyWith(color: textSecondary),
        border: fieldBorder,
        enabledBorder: fieldBorder,
        focusedBorder: fieldBorder.copyWith(
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: fieldBorder.copyWith(borderSide: BorderSide(color: error)),
        focusedErrorBorder: fieldBorder.copyWith(
          borderSide: BorderSide(color: error, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 1,
        shadowColor: shadow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.medium),
          side: BorderSide(color: outline),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        elevation: 8,
        shadowColor: shadow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.large),
          side: BorderSide(color: outline),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: secondary.withValues(alpha: 0.14),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => textTheme.labelMedium?.copyWith(
            color: states.contains(WidgetState.selected)
                ? primary
                : textSecondary,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? primary
                : textSecondary,
          ),
        ),
      ),
    );
  }
}
