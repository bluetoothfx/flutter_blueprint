import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/themes/app_colors_extension.dart';

/// List of extensions for [BuildContext]
extension ContextExtension on BuildContext {
  bool get isLightMode => themeData.brightness == Brightness.light;

  void pop() => Navigator.of(this).pop();

  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => themeData.textTheme;

  AppColorsExtension get appColors {
    final colors = themeData.extension<AppColorsExtension>();
    return colors ??
        (isLightMode ? AppColorsExtension.light : AppColorsExtension.dark);
  }

  void showSnackBar(Widget content) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
      ..showSnackBar(SnackBar(
        content: content,
      ));
  }

  void showSimpleSnackBar(String text) {
    showSnackBar(Text(text));
  }

  void showSnackBarSuccess(String text) {
    showSnackBar(Text(
      text,
      style: textTheme.titleSmall?.copyWith(color: appColors.systemSuccess),
    ));
  }

  void showSnackBarWarning(String text) {
    showSnackBar(Text(
      text,
      style: textTheme.titleSmall?.copyWith(color: appColors.systemWarning),
    ));
  }

  void showSnackBarError(String text) {
    showSnackBar(Text(
      text,
      style: textTheme.titleSmall?.copyWith(color: appColors.systemError),
    ));
  }

  void showSnackBarAndRemoveCurrent(String text) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
      ..showSnackBar(SnackBar(
        content: Text(
          text,
          style: textTheme.titleSmall?.copyWith(color: appColors.systemSuccess),
        ),
      ));
  }

  bool isPortrait() {
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }
}
