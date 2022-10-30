import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'meditation_state.dart';

class MeditationViewModel extends StateNotifier<MeditationState> {
  MeditationViewModel() : super(MeditationState.initial());

  void init() {}

  void changeIndex(int index) {
    if (state.index != index) {
      state = state.copyWith(
        index: index,
      );
    }
  }
}
