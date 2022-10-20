import 'package:flutter/material.dart';

import '../../../../common_widget/space_box.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resource/app_size.dart';
import '../../../../resource/app_text_styles.dart';

class SoundNatureCard extends StatelessWidget {
  const SoundNatureCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// onTap
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(12),
            child: CircleAvatar(
              radius: context.sizes.width / 8,
              backgroundImage: AssetImage(
                Assets.images.imgRainDrop.path,
              ),
            ),
          ),
          const SpaceBox.height(10),
          Text(
            'Raindrops',
            style: AppTextStyles.fontPoppinsRegular14.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
