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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Center(
            //   child: ,
            // ),
            Positioned(
              bottom: 30,
              child: Center(
                child: LargeButton(
                  title: 'Get Started',
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
