import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.ink,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.lime,
        secondary: AppColors.cyan,
        surface: AppColors.panel,
        onPrimary: AppColors.ink,
        onSurface: AppColors.paper,
      ),
      fontFamily: 'Arial',
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.lime,
        selectionColor: Color(0x5577B76A),
      ),
    );
  }
}
