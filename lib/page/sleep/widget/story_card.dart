import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../resource/app_size.dart';
import '../../../resource/app_text_styles.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// [onTap] handle Click
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.sizes.height * 1 / 5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.images.imgNature.path,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Night Fall',
              style: AppTextStyles.fontPoppinsRegular16.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'Night Fall',
              style: AppTextStyles.fontPoppinsRegular16.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
