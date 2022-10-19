import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_tab_state.dart';

class HomeTabViewModel extends StateNotifier<HomeTabState> {
  HomeTabViewModel() : super(HomeTabState.initial());

  void changeIndex(int index) {
    state = state.copyWith(
      index: index,
    );
  }
}
