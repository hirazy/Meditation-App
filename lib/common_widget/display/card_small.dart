import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../resource/app_size.dart';
import '../../resource/app_text_styles.dart';
import '../icon/icon_base.dart';
import '../space_box.dart';

class CardSmall extends StatelessWidget {
  const CardSmall({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            // color: Colors.lightBlue,
            gradient: LinearGradient(
              begin: const Alignment(-1, -4),
              end: const Alignment(1, 4),
              colors: [
                Colors.lightBlue.shade700,
                Colors.lightBlue.shade500,
                Colors.lightBlue.shade200,
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.asset(
                  Assets.images.imgNature.path,
                  height: context.sizes.width / 6,
                  width: context.sizes.width / 6,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceBox.width(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What do you means?',
                    style: AppTextStyles.fontOpenSansBold14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SpaceBox.height(),
                  Text(
                    'Phases',
                    style: AppTextStyles.fontOpenSansRegular13.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              const SpaceBox.width(20),
              Text(
                '11:47',
                style: AppTextStyles.fontPoppinsRegular14.copyWith(
                  color: Colors.white,
                ),
              ),
              const SpaceBox.width(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: IconBase(
                  path: Assets.images.icPlay.path,
                  size: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
