import 'package:flutter/material.dart';

import '../../../../common_widget/base/base_page.dart';

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
    return Column(
      children: [],
    );
  }
}
