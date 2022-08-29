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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AnimLottieCommon(
              height: 200,
              width: 200,
              asset: 'assets/raws/anim_splash_meditation.json',
            )
          ],
        ),
      ),
    );
  }
}
