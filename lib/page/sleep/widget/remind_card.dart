import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_text_styles.dart';
import '../../../resource/constants.dart';

class RemindCard extends StatelessWidget {
  const RemindCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: Constants.spaceWidth,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SpaceBox.width(),
                Image.asset(
                  Assets.images.icRemind.path,
                  width: 15,
                  height: 15,
                ),
                const SpaceBox.width(),
                Text(
                  AppLocalizations.of(context)!.sleepReminder,
                  style: AppTextStyles.fontPoppinsBold14.copyWith(
                    color: const Color(0xFF3d204f),
                  ),
                ),
                const SpaceBox.width(10),
                const Text('Today'),
              ],
            ),
            const SpaceBox.height(5),
            Row(
              children: [
                const VerticalDivider(
                  width: 1,
                  color: Colors.purpleAccent,
                ),
                // const VerticalDivider(
                //   width: 1,
                //   thickness: 1,
                //   color: Colors.red,
                // ),
                const SpaceBox.width(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Evening meditation',
                      style: AppTextStyles.fontOpenSansBold14,
                    ),
                    const SpaceBox.height(5),
                    Text(
                      'Friday, 4 September from 9pm to 10pm',
                      style: AppTextStyles.fontOpenSansBold14,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
