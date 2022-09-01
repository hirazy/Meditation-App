import 'package:flutter/material.dart';

import '../../common_widget/controll/large_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        LargeButton(onTap: () {}),
      ],
    );
  }
}
