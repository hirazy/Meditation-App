import 'package:flutter/material.dart';

import '../../../../common_widget/space_box.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resource/app_size.dart';
import '../../../../resource/app_text_styles.dart';

class MusicCategoryCard extends StatelessWidget {
  const MusicCategoryCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// onTap
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                Assets.images.imgNature3.path,
                fit: BoxFit.cover,
                height: context.sizes.height * 1 / 5,
              ),
            ),
            const SpaceBox.height(15),
            Text(
              'Nature',
              style: AppTextStyles.fontPoppinsRegular14.copyWith(
                color: Colors.black,
              ),
            ),
            // SpaceBox.height(),
          ],
        ),
      ),
    );
  }
}
