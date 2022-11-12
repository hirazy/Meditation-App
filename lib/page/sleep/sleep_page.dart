import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/display/card_action_view.dart';
import '../../common_widget/display/chip_card.dart';
import '../../common_widget/display/list_horizontal.dart';
import '../../common_widget/space_box.dart';
import '../../gen/assets.gen.dart';
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
              const SpaceBox.height(15),
              Container(
                margin: const EdgeInsets.only(
                  left: Constants.spaceWidth,
                ),
                child: Text(
                  AppLocalizations.of(context)!.sleepStories,
                  style: AppTextStyles.fontOverpassRegular14.copyWith(
                    color: Colors.white,
                  ),
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
              ListHorizontal(
                children: Constants.dummySleepStories
                    .map(
                      (e) => StoryCard(
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ),
              const SpaceBox.height(10),
              Container(
                margin: const EdgeInsets.only(
                  left: Constants.spaceWidth,
                ),
                child: Text(
                  AppLocalizations.of(context)!.sleepMusic,
                  style: AppTextStyles.fontOverpassRegular14.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SpaceBox.height(10),
              ListView.builder(
                itemBuilder: (context, index) => CardActionView(
                  title: 'Sleep Music',
                  content: 'Drift off to sleep with these calming tracks',
                  onTap: () {},
                  iconAction: Assets.images.icNext.path,
                ),
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
              ),
              const SpaceBox.height(Constants.paddingHeightBottom),
            ],
          ),
        ),
      ],
    );
  }
}
