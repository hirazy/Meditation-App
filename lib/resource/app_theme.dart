import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith();
  }

  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith();
  }
}
