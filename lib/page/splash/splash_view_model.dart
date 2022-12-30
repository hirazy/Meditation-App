import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'splash_state.dart';

final splashViewModel = StateNotifierProvider<SplashViewModel, SplashState>(
  (ref) => SplashViewModel(read: ref.read),
);

class SplashViewModel extends StateNotifier<SplashState> {
  SplashViewModel({
    required this.read,
  }) : super(SplashState.initial());

  final Reader read;

  void init() {}

  Future<void> loadAppInfo(
    Function() onNextHome,
    Function() onNextLogin,
  ) async {
    onNextHome();
  }

  void changeAnimated() {
    state = state.copyWith(
      isAnimated: true,
    );
  }
}
