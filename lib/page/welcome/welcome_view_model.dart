import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'welcome_state.dart';

class WelcomeViewModel extends StateNotifier<WelcomeState> {
  WelcomeViewModel(super.state);

  void changePageIndex(int index) {
    state = state.copyWith(indexPage: index);
  }
}
