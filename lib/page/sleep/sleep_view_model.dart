import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sleep_state.dart';

class SleepViewModel extends StateNotifier<SleepState> {
  SleepViewModel() : super(SleepState.initial());

  void init() {}
}
