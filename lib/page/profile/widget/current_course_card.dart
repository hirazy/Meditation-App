import 'package:flutter/material.dart';

import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../resource/app_text_styles.dart';

class CurrentCourseCard extends StatelessWidget {
  const CurrentCourseCard({
    required this.pathIcon,
    required this.contentWidget,
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// [contentWidget]
  final Widget contentWidget;

  /// [pathIcon] address of icon
  final String pathIcon;

  /// [onTap] handle onClick
  final VoidCallback onTap;

  /// [title]
  final String title;

  /// [subTitle]
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orangeAccent.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconBase(
                  path: pathIcon,
                  size: 25,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.fontPoppinsBold14.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      subTitle,
                      style: AppTextStyles.fontPoppinsRegular12.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ],
            ),
            const SpaceBox.height(10),
            SizedBox(
              height: 150,
              child: contentWidget,
            ),
          ],
        ),
      ),
    );
  }
}
