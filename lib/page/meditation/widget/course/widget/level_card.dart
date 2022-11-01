import 'package:flutter/material.dart';

import '../../../../../common_widget/display/list_horizontal.dart';
import '../../../../../common_widget/icon/icon_base.dart';
import '../../../../../common_widget/space_box.dart';
import '../../../../../data/model/api/response/course.dart';
import '../../../../../data/model/api/response/level_course.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../resource/app_size.dart';
import '../../../../../resource/app_text_styles.dart';
import '../../../../../resource/constants.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    required this.levelCourse,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// Level Course
  final LevelCourse levelCourse;

  /// [onTap] handle Click Card
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpaceBox.height(20),
        Container(
          margin: const EdgeInsets.only(
            left: Constants.spaceWidth,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  levelCourse.title ?? '',
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
            levelCourse.subTitle ?? '',
            style: AppTextStyles.fontPoppinsRegular15.copyWith(
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SpaceBox.height(),
        if (levelCourse.courses != null && levelCourse.courses!.isNotEmpty)
          ListHorizontal(
            children: levelCourse.courses!
                .map(
                  (e) => bannerCard(e, context),
                )
                .toList(),
          ),
      ],
    );
  }

  Widget bannerCard(Course course, BuildContext context) {
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
                  image: (course.banner != null && course.banner!.isNotEmpty
                          ? NetworkImage(course.banner!)
                          : AssetImage(Assets.images.imgNature.path))
                      as ImageProvider,
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
                    child: Text(
                      '15 min',
                      style: AppTextStyles.fontPoppinsRegular14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SpaceBox.height(5),
            Text(
              course.name ?? '',
              style: AppTextStyles.fontPoppinsRegular14.copyWith(
                color: Colors.white,
              ),
            ),
            const SpaceBox.height(5),
            Text(
              course.description ?? '',
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
