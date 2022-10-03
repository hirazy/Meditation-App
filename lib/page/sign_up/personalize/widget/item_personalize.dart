import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_widget/icon/icon_base.dart';
import '../../../../common_widget/space_box.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resource/app_color.dart';
import '../model/personalize_item.dart';

class ItemPersonalize extends StatelessWidget {
  const ItemPersonalize({
    required this.onTap,
    required this.item,
    Key? key,
  }) : super(key: key);

  /// Item isSelected
  final PersonalizeItem item;

  /// onTap Item
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: item.isSelected
                ? context.colors.gradientActiveButton[1]
                : context.colors.gradientInActiveButton[1],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: [
            BoxShadow(
              color: item.isSelected
                  ? context.colors.gradientActiveButton[0]
                  : Colors.transparent,
              spreadRadius: 0.5,
              blurRadius: 6,
              offset: const Offset(0, 0),
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.colors.hoverBackground,
                  shape: BoxShape.circle,
                ),
                child: IconBase(
                  path: Assets.images.icLotus.path,
                  size: 40,
                ),
              ),
              const SpaceBox.height(),
              Text(
                'Meditations',
                style: GoogleFonts.overpass(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
