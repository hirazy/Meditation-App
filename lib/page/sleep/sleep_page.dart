import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/display/chip_card.dart';
import '../../common_widget/display/list_horizontal.dart';
import '../../common_widget/space_box.dart';
import '../../resource/app_text_styles.dart';
import '../../resource/constants.dart';
import 'widget/remind_card.dart';
import 'widget/story_card.dart';

class SleepPage extends BasePage {
  const SleepPage({Key? key}) : super(key: key);

  @override
  SleepPageState createState() => SleepPageState();
}

class SleepPageState extends BasePageState<SleepPage> {
  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  Color get backgroundColor => const Color(0xff2e153d);

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceBox.height(10),
              RemindCard(onTap: () {}),
              const SpaceBox.height(10),
              Text(
                AppLocalizations.of(context)!.sleepStories,
                style: AppTextStyles.fontOverpassRegular14.copyWith(
                  color: Colors.white,
                ),
              ),
              const SpaceBox.height(),
              ListHorizontal(
                children: Constants.dummySleepStories
                    .map(
                      (e) => ChipCard(
                        title: 'Light Nice Like',
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
              const SpaceBox.height(20),
              StoryCard(
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
