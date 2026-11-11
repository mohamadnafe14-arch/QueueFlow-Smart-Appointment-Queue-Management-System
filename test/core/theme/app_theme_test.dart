import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_flow/core/theme/app_colors.dart';
import 'package:queue_flow/core/theme/app_text_styles.dart';
import 'package:queue_flow/core/theme/app_theme.dart';
import 'package:queue_flow/main.dart';

void main() {
  test('defines Material 3 light and dark themes with Stitch colors', () {
    expect(AppTheme.light.useMaterial3, isTrue);
    expect(AppTheme.dark.useMaterial3, isTrue);
    expect(AppTheme.light.brightness, Brightness.light);
    expect(AppTheme.dark.brightness, Brightness.dark);
    expect(AppTheme.light.colorScheme.primary, AppColors.lightPrimary);
    expect(AppTheme.light.colorScheme.secondary, AppColors.lightSecondary);
    expect(AppTheme.dark.colorScheme.primary, AppColors.darkPrimary);
    expect(AppTheme.dark.colorScheme.secondary, AppColors.darkSecondary);
    expect(AppTheme.light.colorScheme.error, AppColors.lightError);
    expect(AppTheme.dark.colorScheme.error, AppColors.darkError);
    expect(
      AppTheme.light.textTheme.bodyMedium?.fontFamily,
      AppTextStyles.fontFamily,
    );
    expect(AppTextStyles.ticket.fontFamily, AppTextStyles.monoFontFamily);
  });

  test('configures common component themes in both variants', () {
    for (final theme in [AppTheme.light, AppTheme.dark]) {
      expect(theme.appBarTheme, isNotNull);
      expect(theme.elevatedButtonTheme.style, isNotNull);
      expect(theme.outlinedButtonTheme.style, isNotNull);
      expect(theme.inputDecorationTheme.filled, isTrue);
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());
      expect(theme.dialogTheme.shape, isA<RoundedRectangleBorder>());
      expect(theme.navigationBarTheme, isNotNull);
    }
  });

  testWidgets('MaterialApp uses system theme mode and both theme variants', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.system);
    expect(app.theme, same(AppTheme.light));
    expect(app.darkTheme, same(AppTheme.dark));
  });
}
