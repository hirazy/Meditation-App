import 'package:flutter/material.dart';

import '../../common_widget/base/base_page.dart';

class SleepPage extends BasePage {
  const SleepPage({Key? key}) : super(key: key);

  @override
  SleepPageState createState() => SleepPageState();
}

class SleepPageState extends BasePageState<SleepPage> {

  @override
  Color get backgroundColor => Colors.red;

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
