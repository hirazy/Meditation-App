import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith();
  }

  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith();
  }

  static ThemeData appTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: AppColor.light.white,
      ),
    );
  }
}
