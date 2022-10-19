import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'music_top_state.dart';

class MusicTopViewModel extends StateNotifier<MusicTopState> {
  MusicTopViewModel() : super(MusicTopState.initial());

  void init() {}
}
