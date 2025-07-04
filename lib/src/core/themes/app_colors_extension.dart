import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/themes/app_colors.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  
  static const AppColorsExtension light = AppColorsExtension(
    systemBase: AppColors.systemBaseLight,
    systemPrimary: AppColors.systemPrimaryLight,
    systemTertiary: AppColors.systemTertiaryLight,
    systemSecondary: AppColors.systemSecondaryLight,
    systemError: AppColors.systemErrorLight,
    systemWarning: AppColors.systemWarningLight,
    systemSuccess: AppColors.systemSuccessLight,
    systemIndigo: AppColors.systemIndigoLight,
    systemPurple: AppColors.systemPurpleLight,
    systemTeal: AppColors.systemTealLight,
    systemPink: AppColors.systemPinkLight,
    systemBlue: AppColors.systemBlueLight,
    gray1: AppColors.gray1Light,
    gray2: AppColors.gray2Light,
    gray3: AppColors.gray3Light,
    gray4: AppColors.gray4Light,
    gray5: AppColors.gray5Light,
    gray6: AppColors.gray6Light,
    labelPrimary: AppColors.labelPrimaryLight,
    labelSecondary: AppColors.labelSecondaryLight,
    labelTertiary: AppColors.labelTertiaryLight,
    labelQuaternary: AppColors.labelQuaternaryLight,
    backgroundPrimary: AppColors.backgroundPrimaryLight,
    backgroundSecondary: AppColors.backgroundSecondaryLight,
    backgroundTertiary: AppColors.backgroundTertiaryLight,
  );

  static const AppColorsExtension dark = AppColorsExtension(
    systemBase: AppColors.systemBaseDark,
    systemPrimary: AppColors.systemPrimaryDark,
    systemTertiary: AppColors.systemTertiaryDark,
    systemSecondary: AppColors.systemSecondaryDark,
    systemError: AppColors.systemErrorDark,
    systemWarning: AppColors.systemWarningDark,
    systemSuccess: AppColors.systemSuccessDark,
    systemIndigo: AppColors.systemIndigoDark,
    systemPurple: AppColors.systemPurpleDark,
    systemTeal: AppColors.systemTealDark,
    systemPink: AppColors.systemPinkDark,
    systemBlue: AppColors.systemBlueDark,
    gray1: AppColors.gray1Dark,
    gray2: AppColors.gray2Dark,
    gray3: AppColors.gray3Dark,
    gray4: AppColors.gray4Dark,
    gray5: AppColors.gray5Dark,
    gray6: AppColors.gray6Dark,
    labelPrimary: AppColors.labelPrimaryDark,
    labelSecondary: AppColors.labelSecondaryDark,
    labelTertiary: AppColors.labelTertiaryDark,
    labelQuaternary: AppColors.labelQuaternaryDark,
    backgroundPrimary: AppColors.backgroundPrimaryDark,
    backgroundSecondary: AppColors.backgroundSecondaryDark,
    backgroundTertiary: AppColors.backgroundTertiaryDark,
  );

  final Color systemBase;
  final Color systemPrimary;
  final Color systemTertiary;
  final Color systemSecondary;
  final Color systemError;
  final Color systemWarning;
  final Color systemSuccess;
  final Color systemIndigo;
  final Color systemPurple;
  final Color systemTeal;
  final Color systemPink;
  final Color systemBlue;

  final Color gray1;
  final Color gray2;
  final Color gray3;
  final Color gray4;
  final Color gray5;
  final Color gray6;

  final Color labelPrimary;
  final Color labelSecondary;
  final Color labelTertiary;
  final Color labelQuaternary;

  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;

  const AppColorsExtension({
    required this.systemBase,
    required this.systemPrimary,
    required this.systemTertiary,
    required this.systemSecondary,
    required this.systemError,
    required this.systemWarning,
    required this.systemSuccess,
    required this.systemIndigo,
    required this.systemPurple,
    required this.systemTeal,
    required this.systemPink,
    required this.systemBlue,
    required this.gray1,
    required this.gray2,
    required this.gray3,
    required this.gray4,
    required this.gray5,
    required this.gray6,
    required this.labelPrimary,
    required this.labelSecondary,
    required this.labelTertiary,
    required this.labelQuaternary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? systemBase,
    Color? systemPrimary,
    Color? systemTertiary,
    Color? systemSecondary,
    Color? systemError,
    Color? systemWarning,
    Color? systemSuccess,
    Color? systemIndigo,
    Color? systemPurple,
    Color? systemTeal,
    Color? systemPink,
    Color? systemBlue,
    Color? gray1,
    Color? gray2,
    Color? gray3,
    Color? gray4,
    Color? gray5,
    Color? gray6,
    Color? labelPrimary,
    Color? labelSecondary,
    Color? labelTertiary,
    Color? labelQuaternary,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
  }) {
    return AppColorsExtension(
      systemBase: systemBase ?? this.systemBase,
      systemPrimary: systemPrimary ?? this.systemPrimary,
      systemTertiary: systemTertiary ?? this.systemTertiary,
      systemSecondary: systemSecondary ?? this.systemSecondary,
      systemError: systemError ?? this.systemError,
      systemWarning: systemWarning ?? this.systemWarning,
      systemSuccess: systemSuccess ?? this.systemSuccess,
      systemIndigo: systemIndigo ?? this.systemIndigo,
      systemPurple: systemPurple ?? this.systemPurple,
      systemTeal: systemTeal ?? this.systemTeal,
      systemPink: systemPink ?? this.systemPink,
      systemBlue: systemBlue ?? this.systemBlue,
      gray1: gray1 ?? this.gray1,
      gray2: gray2 ?? this.gray2,
      gray3: gray3 ?? this.gray3,
      gray4: gray4 ?? this.gray4,
      gray5: gray5 ?? this.gray5,
      gray6: gray6 ?? this.gray6,
      labelPrimary: labelPrimary ?? this.labelPrimary,
      labelSecondary: labelSecondary ?? this.labelSecondary,
      labelTertiary: labelTertiary ?? this.labelTertiary,
      labelQuaternary: labelQuaternary ?? this.labelQuaternary,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
      covariant ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      systemBase: Color.lerp(systemBase, other.systemBase, t) ?? systemBase,
      systemPrimary: Color.lerp(systemPrimary, other.systemPrimary, t) ?? systemPrimary,
      systemTertiary: Color.lerp(systemTertiary, other.systemTertiary, t) ?? systemTertiary,
      systemSecondary: Color.lerp(systemSecondary, other.systemSecondary, t) ?? systemSecondary,
      systemError: Color.lerp(systemError, other.systemError, t) ?? systemError,
      systemWarning: Color.lerp(systemWarning, other.systemWarning, t) ?? systemWarning,
      systemSuccess: Color.lerp(systemSuccess, other.systemSuccess, t) ?? systemSuccess,
      systemIndigo: Color.lerp(systemIndigo, other.systemIndigo, t) ?? systemIndigo,
      systemPurple: Color.lerp(systemPurple, other.systemPurple, t) ?? systemPurple,
      systemTeal: Color.lerp(systemTeal, other.systemTeal, t) ?? systemTeal,
      systemPink: Color.lerp(systemPink, other.systemPink, t) ?? systemPink,
      systemBlue: Color.lerp(systemBlue, other.systemBlue, t) ?? systemBlue,
      gray1: Color.lerp(gray1, other.gray1, t) ?? gray1,
      gray2: Color.lerp(gray2, other.gray2, t) ?? gray2,
      gray3: Color.lerp(gray3, other.gray3, t) ?? gray3,
      gray4: Color.lerp(gray4, other.gray4, t) ?? gray4,
      gray5: Color.lerp(gray5, other.gray5, t) ?? gray5,
      gray6: Color.lerp(gray6, other.gray6, t) ?? gray6,
      labelPrimary: Color.lerp(labelPrimary, other.labelPrimary, t) ?? labelPrimary,
      labelSecondary: Color.lerp(labelSecondary, other.labelSecondary, t) ?? labelSecondary,
      labelTertiary: Color.lerp(labelTertiary, other.labelTertiary, t) ?? labelTertiary,
      labelQuaternary: Color.lerp(labelQuaternary, other.labelQuaternary, t) ?? labelQuaternary,
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t) ?? backgroundPrimary,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t) ?? backgroundSecondary,
      backgroundTertiary:
          Color.lerp(backgroundTertiary, other.backgroundTertiary, t) ?? backgroundTertiary,
    );
  }
}
