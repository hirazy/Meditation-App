import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_text_styles.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  style: AppTextStyles.fontPoppinsRegular14.copyWith(),
                ),
                const SpaceBox.width(10),
                const Text('Today'),
              ],
            ),
            Row(
              children: [
                const VerticalDivider(
                  width: 1,
                  color: Colors.red,
                ),
                const SpaceBox.width(),
                Column(
                  children: [
                    Text(
                      'Evening meditation',
                      style: AppTextStyles.fontOpenSansBold14,
                    ),
                    Text(
                      'Friday, 4 September from 9pm o 10pm',
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
