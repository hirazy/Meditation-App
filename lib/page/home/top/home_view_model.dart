import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/extension/date_time_extension.dart';
import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState.initial());

  late VideoPlayerController controller;

  Future<void> init(BuildContext context) async {
    controller = VideoPlayerController.asset(Assets.video.videoSunset);
    await controller.setLooping(true);
    await controller.initialize();
    await controller.play();
    final dateTime = DateTime.now();

    if (!mounted) {
      return;
    }

    state = state.copyWith(
      controller: controller,
      sessionDay: dateTime.getGreetingDay(context, 'Test'),
    );
  }

  void changeExpression() {}

  void resumeVideo() {
    controller.play();
  }

  void pauseVideo() {
    controller.pause();
  }

  void changeExpandedAppBar(bool isExpandedAppBar) {
    if (state.isExpandedAppBar != isExpandedAppBar) {
      state = state.copyWith(
        isExpandedAppBar: isExpandedAppBar,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
