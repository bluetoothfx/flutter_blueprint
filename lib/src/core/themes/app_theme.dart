import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/themes/app_colors.dart';
import 'package:flutter_blueprint/src/core/themes/app_colors_extension.dart';
import 'package:flutter_blueprint/src/core/themes/spacing/spacing_constants.dart';
import 'package:flutter_blueprint/src/core/themes/components/app_text_themes.dart';

abstract class AppTheme {
  static final ThemeData dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      onPrimary: AppColors.systemPrimaryDark,
      onTertiary: AppColors.systemTertiaryDark,
      secondary: AppColors.backgroundSecondaryDark,
      error: AppColors.systemErrorDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundPrimaryDark,
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundPrimaryDark,
      titleTextStyle: TextStyle(
          color: AppColors.labelPrimaryDark,
          fontWeight: FontWeight.w700,
          fontSize: 22.0),
    ),
    tabBarTheme: const TabBarThemeData(
      indicatorColor: AppColors.labelPrimaryDark,
      labelStyle: TextStyle(
        color: AppColors.labelPrimaryDark,
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.labelSecondaryDark,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        color: AppColors.labelPrimaryDark,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.labelSecondaryDark,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.labelPrimaryDark,
        size: 18,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.labelSecondaryDark,
        size: 18,
      ),
      backgroundColor: AppColors.backgroundPrimaryDark,
    ),
    brightness: Brightness.dark,
    textTheme: AppTextThemes.dark,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.backgroundPrimaryLight,
      contentTextStyle: TextStyle(
        color: AppColors.labelPrimaryLight,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: const [AppColorsExtension.dark],
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: AppColors.systemBaseDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacingConstants.md)),
    ),
    pageTransitionsTheme: _appPageTransitionTheme(),
  );

  static final ThemeData light = ThemeData(
    colorScheme: const ColorScheme.light(
      onPrimary: AppColors.systemPrimaryLight,
      onTertiary: AppColors.systemTertiaryLight,
      secondary: AppColors.backgroundSecondaryLight,
      error: AppColors.systemErrorLight,
    ),
    scaffoldBackgroundColor: AppColors.backgroundPrimaryLight,
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundSecondaryLight,
      titleTextStyle: TextStyle(
          color: AppColors.labelPrimaryLight,
          fontWeight: FontWeight.w700,
          fontSize: 22.0),
    ),
    tabBarTheme: const TabBarThemeData(
      indicatorColor: AppColors.labelPrimaryLight,
      labelStyle: TextStyle(
        color: AppColors.labelPrimaryLight,
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.labelSecondaryLight,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        color: AppColors.labelPrimaryLight,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.labelSecondaryLight,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.labelPrimaryLight,
        size: 18,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.labelSecondaryLight,
        size: 18,
      ),
      backgroundColor: AppColors.backgroundPrimaryLight,
    ),
    brightness: Brightness.light,
    textTheme: AppTextThemes.light,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.backgroundPrimaryDark,
      contentTextStyle: TextStyle(
        color: AppColors.labelPrimaryDark,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: const [AppColorsExtension.light],
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: AppColors.systemBaseLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacingConstants.md)),
    ),
    pageTransitionsTheme: _appPageTransitionTheme(),
  );

  static PageTransitionsTheme _appPageTransitionTheme() {
    return const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        }
    );
  }
}
