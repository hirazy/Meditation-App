import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../resource/app_size.dart';
import '../../resource/app_text_styles.dart';
import '../space_box.dart';

class CardExpand extends StatelessWidget {
  const CardExpand({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    Assets.images.imgBgTest.path,
                    fit: BoxFit.fill,
                    width: context.sizes.width * 3 / 5,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceBox.height(),
                  Text(
                    'Good Morning',
                    maxLines: 1,
                    style: AppTextStyles.fontPoppinsRegular14.copyWith(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SpaceBox.height(),
                  Text(
                    'Playlist',
                    maxLines: 1,
                    style: AppTextStyles.fontPoppinsRegular14.copyWith(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
