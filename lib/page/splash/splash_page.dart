import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/provider/app_navigator_provider.dart';
import '../../gen/assets.gen.dart';
import '../../navigation/app_route.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModel.notifier).init();
    });

    Future.delayed(const Duration(seconds: 1), () {
      ref.read(splashViewModel.notifier).changeAnimated();
    });

    Future.delayed(
      const Duration(seconds: 5),
      () async {
        await ref.read(splashViewModel.notifier).loadAppInfo(
          () {
            _navigateToNext();
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
                // AnimatedTextKit(
                //   onFinished: () {},
                //   animatedTexts: [
                //     RotateAnimatedText(
                //       AppText.appName,
                //       duration: const Duration(
                //         seconds: 2,
                //       ),
                //       textStyle: const TextStyle(
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedPadding(
                      padding: const EdgeInsets.only(top: 40),
                      duration: const Duration(seconds: 3),
                      curve: Curves.easeInOutCubicEmphasized,
                      child: AnimatedOpacity(
                        opacity: ref.watch(splashViewModel).isAnimated ? 1 : 0,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInCubic,
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 50,
                          foregroundImage: AssetImage(
                            Assets.images.icLogo.path,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNext() {
    ref.read(appNavigatorProvider).navigateTo(
          AppRoute.homeTab,
          shouldClearStack: true,
        );
  }
}
