import 'package:flutter/material.dart';

import '../../../../../common_widget/display/list_horizontal.dart';
import '../../../../../common_widget/icon/icon_base.dart';
import '../../../../../common_widget/space_box.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../resource/app_size.dart';
import '../../../../../resource/app_text_styles.dart';
import '../../../../../resource/constants.dart';
import '../../../../home/model/user_expression.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// Title
  final String title;

  /// SubTitle
  final String subTitle;

  /// Courses

  /// [onTap] handle Click Card
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpaceBox.height(),
        Container(
          margin: const EdgeInsets.only(
            left: Constants.spaceWidth,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Basics of meditation',
                  style: AppTextStyles.fontPoppinsBold18.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SpaceBox.width(),
              IconBase(
                path: Assets.images.icNext.path,
              ),
              const SpaceBox.width(),
            ],
          ),
        ),
        const SpaceBox.height(5),
        Container(
          margin: const EdgeInsets.only(
            left: Constants.spaceWidth,
            right: 50,
          ),
          child: Text(
            'Before you begin',
            style: AppTextStyles.fontPoppinsRegular15.copyWith(
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SpaceBox.height(),
        ListHorizontal(
          children: expressions
              .map(
                (e) => bannerCard(context),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget bannerCard(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: context.sizes.width * 3 / 5,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.sizes.width * 3 / 5,
              height: context.sizes.height * 1 / 5,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.images.imgNature.path),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: const Text('15 min'),
                  ),
                ],
              ),
            ),
            const SpaceBox.height(5),
            Text(
              'What is meditation?',
              style: AppTextStyles.fontPoppinsRegular14.copyWith(
                color: Colors.white,
              ),
            ),
            const SpaceBox.height(5),
            Text(
              'Answer on the most important questions about meditation',
              style: AppTextStyles.fontPoppinsRegular13.copyWith(
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
