import 'package:flutter/material.dart';

import '../../common_widget/base/base_page.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BasePageState<HomePage> {
  @override
  Color? get backgroundColor => Colors.red;

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
