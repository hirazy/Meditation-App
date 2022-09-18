import 'package:flutter/material.dart';

class AppColor {
  const AppColor({
    required this.lightBlue,
    required this.disable,
    required this.border,
  });

  /// light Blue
  final Color lightBlue;

  /// Disable
  final Color disable;

  /// Border
  final Color border;

  /// Light Theme
  static const light = AppColor(
    lightBlue: Color.fromARGB(100, 110, 185, 248),
    disable: Color(0xFFE7E9EB),
    border: Color(0xFFE7E9EB),
  );

  /// Dark Theme
}

extension AppColorExtension on BuildContext {
  AppColor get colors {
    return _colorFromBrightness(Theme.of(this).brightness);
  }

  AppColor _colorFromBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return AppColor.light;
      case Brightness.dark:
        return AppColor.light;
    }
  }
}
