import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel() : super(HomeState.initial());

  void changeIndex(int index) {
    state = state.copyWith(
      index: index,
    );
  }
}
