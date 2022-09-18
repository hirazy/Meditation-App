import 'package:flutter/material.dart';

import 'app_fonts.dart';
import 'font_sizes.dart';

class AppTextStyles {
  AppTextStyles._private();

  /// Font Style: Black - Size: 14,
  static const TextStyle style =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400);

  /// Font Style:
  static final TextStyle fontPoppinsRegular16 = TextStyle(
    fontFamily: AppFonts.fontPoppins,
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font16.fontSize,
  );
}
