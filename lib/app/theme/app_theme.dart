import 'package:cota_clara/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      onError: AppColors.errorContainer,
      outline: AppColors.border,
    );

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.canvas,
      colorScheme: colorScheme,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.surfaceElevated,
        selectionHandleColor: AppColors.primary,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.surfaceElevated,
        contentTextStyle: TextStyle(color: AppColors.textPrimary),
        behavior: SnackBarBehavior.floating,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.navigation,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty<IconThemeData?>.fromMap({
          WidgetState.selected: IconThemeData(color: AppColors.primary),
          WidgetState.any: IconThemeData(color: AppColors.textDisabled),
        }),
        labelTextStyle: WidgetStateProperty<TextStyle?>.fromMap({
          WidgetState.selected: TextStyle(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          WidgetState.any: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        }),
      ),
    );
  }
}
