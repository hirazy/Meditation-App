import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/controll/large_button.dart';
import '../../common_widget/controll/page_view_list.dart';
import '../../common_widget/space_box.dart';
import '../../gen/assets.gen.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends ConsumerState<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: top(),
            ),
            bottom(),
          ],
        ),
      ),
    );
  }

  Widget top() {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageViewList(
            images: [
              Assets.images.imgMoonLight1.path,
              Assets.images.imgMoonLight1.path,
            ],
          ),
          Text(
            AppLocalizations.of(context)!.welcomeHeaven,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SpaceBox.height(10),
          Text(
            AppLocalizations.of(context)!.welcomeTitle,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Widget bottom() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LargeButton(
            title: AppLocalizations.of(context)!.getStarted,
            onTap: () {},
          ),
          const SpaceBox.height(15),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.haveAccount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (kDebugMode) {
                        print('On Tap');
                      }
                    },
                  text: ' ${AppLocalizations.of(context)!.logIn}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
