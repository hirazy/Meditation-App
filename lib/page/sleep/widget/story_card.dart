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
        width: context.sizes.width * 2 / 5,
        height: context.sizes.height * 1 / 4,
        margin: const EdgeInsets.only(
          right: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              Assets.images.imgNature.path,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(
            8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Night Fall',
                style: AppTextStyles.fontOverpassRegular15.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'Night Fall',
                style: AppTextStyles.fontOpenSansRegular13.copyWith(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
