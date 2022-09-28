import 'package:flutter/material.dart';

class AppColor {
  const AppColor({
    required this.lightBlue,
    required this.disable,
    required this.border,
    required this.gradientLargeButton,
  });

  /// light Blue
  final Color lightBlue;

  /// Disable
  final Color disable;

  /// Border
  final Color border;

  /// Gradient - Large Button Color
  final List<Color> gradientLargeButton;

  /// Light Theme
  static const light = AppColor(
    lightBlue: Color.fromARGB(255, 32, 148, 246),
    disable: Color(0xFFE7E9EB),
    border: Color(0xFFE7E9EB),
    gradientLargeButton: [
      Color(0xFFe8a1fd),
      Color(0xFFe97bfc),
    ],
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
