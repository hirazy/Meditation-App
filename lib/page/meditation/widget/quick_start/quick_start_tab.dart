import 'package:flutter/material.dart';

import '../../../../common_widget/base/base_page.dart';
import '../../../../common_widget/display/chip_card.dart';
import '../../../../common_widget/display/list_horizontal.dart';
import '../../../../common_widget/space_box.dart';
import '../../../../resource/app_size.dart';
import '../../../../resource/constants.dart';
import 'widget/quick_course_card.dart';

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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.amberAccent,
            Colors.orange,
            Colors.orangeAccent,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceBox.height(15),
            ListHorizontal(
              children: Constants.dummySleepStories
                  .map(
                    (e) => ChipCard(
                      title: e,
                      onTap: () {},
                    ),
                  )
                  .toList(),
            ),
            const SpaceBox.height(15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.spaceWidth),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: context.sizes.height * 1 / 4 + 60,
                ),
                itemCount: Constants.dummyCourses.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return QuickCourseCard(
                    course: Constants.dummyCourses[index],
                    onTap: () {},
                  );
                },
              ),
            ),
            const SpaceBox.height(
              Constants.paddingHeightBottom,
            ),
          ],
        ),
      ),
    );
  }
}
