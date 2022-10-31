import 'package:flutter/material.dart';

import '../../../../common_widget/base/base_page.dart';
import '../../../../common_widget/display/chip_card.dart';
import '../../../../common_widget/display/list_horizontal.dart';
import '../../../../common_widget/space_box.dart';
import '../../../../data/provider/app_navigator_provider.dart';
import '../../../../navigation/app_route.dart';
import '../../../../resource/constants.dart';
import '../../../music/top/widgets/music_category_card.dart';

class QuickStartTab extends BasePage {
  const QuickStartTab({Key? key}) : super(key: key);

  @override
  QuickStartTabState createState() => QuickStartTabState();
}

class QuickStartTabState extends BasePageState<QuickStartTab> {
  @override
  Color get backgroundColor => Colors.blueAccent;

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
          const SpaceBox.height(),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return MusicCategoryCard(onTap: () {
                // ref.read(appNavigatorProvider).navigateTo(AppRoute.)
              });
            },
          ),
          const SpaceBox.height(80),
        ],
      ),
    );
  }
}
