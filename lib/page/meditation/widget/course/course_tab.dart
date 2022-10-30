import 'package:flutter/material.dart';

import '../../../../common_widget/base/base_page.dart';
import 'widget/level_card.dart';

class CourseTab extends BasePage {
  const CourseTab({Key? key}) : super(key: key);

  @override
  CourseTabState createState() => CourseTabState();
}

class CourseTabState extends BasePageState<CourseTab> {
  @override
  Color get backgroundColor => Colors.red;

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        LevelCard(
          title: '',
          onTap: () {},
          subTitle: '',
        )
      ],
    );
  }
}
