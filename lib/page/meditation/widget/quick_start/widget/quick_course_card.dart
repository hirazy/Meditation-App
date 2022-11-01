import 'package:flutter/material.dart';

import '../../../../../common_widget/space_box.dart';
import '../../../../../data/model/api/response/course.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../resource/app_size.dart';
import '../../../../../resource/app_text_styles.dart';

class QuickCourseCard extends StatelessWidget {
  const QuickCourseCard({
    required this.course,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Course course;

  /// [onTap] handle Click Card
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.sizes.height * 1 / 4,
            width: context.sizes.width,
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
          const SpaceBox.height(),
          Text(
            course.name ?? '',
            style: AppTextStyles.fontPoppinsRegular15.copyWith(
              color: Colors.white,
            ),
          ),
          const SpaceBox.height(5),
          Text(
            course.author ?? '',
            style: AppTextStyles.fontPoppinsRegular15.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
