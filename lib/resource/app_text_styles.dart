import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_fonts.dart';
import 'font_sizes.dart';

/// Weight: 400 - Regular, 700 - Bold
class AppTextStyles {
  AppTextStyles._private();

  /// Font Style: Black - Size: 14,
  static const TextStyle style =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400);

  /// Font Style: Poppins - Weight: 400 - Size 14
  static final TextStyle fontPoppinsRegular14 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font14.fontSize,
  );

  /// Font Style: Poppins - Weight: 700 - Size 14
  static final TextStyle fontPoppinsBold18 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font18.fontSize,
  );

  /// Font Style: Overpass - Weight: 700 - Size 20
  static final TextStyle fontPoppinsBold20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font20.fontSize,
  );

  /// Font Style: Overpass - Weight: 700 - Size 20
  static final TextStyle fontPoppinsBold22 = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font22.fontSize,
  );

  /// Font Style: Overpass - Weight: 400 - Size 16
  static final TextStyle fontPoppinsRegular16 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font16.fontSize,
  );

  /// Font Style: Overpass - Weight: 400 - Size 14
  static final TextStyle fontOverpassRegular14 = GoogleFonts.overpass(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font14.fontSize,
  );

  /// Font Style: Overpass - Weight: 400 - Size 15
  static final TextStyle fontOverpassRegular15 = GoogleFonts.overpass(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font15.fontSize,
  );

  /// Font Style: Overpass - Weight: 700 - Size 22
  static final TextStyle fontOverpassBold22 = GoogleFonts.overpass(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font22.fontSize,
  );

  /// Font Style: OpenSans - Weight: 400 - Size 14
  static final TextStyle fontOpenSansRegular14 = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font14.fontSize,
  );

  /// Font Style: OpenSans - Weight: 700 - Size 14
  static final TextStyle fontOpenSansBold14 = GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font14.fontSize,
  );

  /// Font Style: OpenSans - Weight: 400 - Size 14
  static final TextStyle fontOpenSansRegular13 = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font13.fontSize,
  );

  /// Font Style: OpenSans - Weight: 400 - Size 14
  static final TextStyle fontOpenSansBold12 = GoogleFonts.openSans(
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.font12.fontSize,
  );

  /// Font Style: OpenSans - Weight: 700 - Size 20
  static final TextStyle fontOpenSansBold20 = GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font20.fontSize,
  );

  /// Font Style: OpenSans - Weight: 700 - Size 22
  static final TextStyle fontOpenSansBold22 = GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font22.fontSize,
  );

  /// Font Style: OpenSans - Weight: 700 - Size 25
  static final TextStyle font = GoogleFonts.amaticSc(
    fontWeight: FontWeight.w700,
    fontSize: FontSizes.font25.fontSize,
  );


}
