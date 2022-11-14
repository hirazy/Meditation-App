import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_text_styles.dart';

class CurrentCourseCard extends StatelessWidget {
  const CurrentCourseCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.orangeAccent,
        ),
        child: Column(
          children: [
            // Expanded(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: IconBase(
                    path: Assets.images.icMeditationCourse.path,
                    size: 25,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.course,
                      style: AppTextStyles.fontPoppinsBold16.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      AppLocalizations.of(context)!.course,
                      style: AppTextStyles.fontPoppinsRegular14.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ],
            ),
            const SpaceBox.height(10),
            CircularPercentIndicator(
              radius: 60,
              animation: true,
              animationDuration: 1000,
              lineWidth: 10,
              percent: 1,
              reverse: false,
              arcType: ArcType.FULL,
              startAngle: 0,
              animateFromLastPercent: true,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '16',
                style: AppTextStyles.fontOpenSansBold22.copyWith(
                  color: Colors.white,
                ),
              ),
              progressColor: Colors.indigoAccent,
            ),
          ],
        ),
      ),
    );
  }
}
