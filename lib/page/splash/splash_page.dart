import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/anim_lottie/anim_lottie_common.dart';
import 'splash_view_model.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final splashState = ref.watch(splashViewModel);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          'assets/images/img_moon_light_1.png',
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
                      '',
                      duration: const Duration(
                        seconds: 2,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Meditation App',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Center(
                  child: AnimLottieCommon(
                    height: 200,
                    width: 200,
                    asset: 'assets/raws/anim_splash_meditation.json',
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
