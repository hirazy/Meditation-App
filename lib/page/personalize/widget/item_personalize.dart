import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';

class ItemPersonalize extends StatelessWidget {
  const ItemPersonalize({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: const Color.fromARGB(255, 185, 123, 252),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 232, 161, 253),
              spreadRadius: 0.5,
              blurRadius: 6,
              offset: Offset(0, 0),
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
                decoration: const BoxDecoration(
                  color: Color.fromARGB(77, 255, 255, 255),
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
