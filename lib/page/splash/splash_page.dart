import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/anim_lottie/anim_lottie_common.dart';
import '../../gen/assets.gen.dart';
import '../../navigation/app_route.dart';
import '../../resource/app_text.dart';
import 'splash_view_model.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        await ref.read(splashViewModel.notifier).loadAppInfo(
          () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoute.welcome,
              (route) => false,
            );
          },
          () {},
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          Assets.images.imgMoonLight1.path,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  onFinished: () {},
                  animatedTexts: [
                    RotateAnimatedText(
                      AppText.appName,
                      duration: const Duration(
                        seconds: 2,
                      ),
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: AnimLottieCommon(
                    height: 200,
                    width: 200,
                    asset: Assets.raws.animSplashMeditation,
                    isAnimated: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
