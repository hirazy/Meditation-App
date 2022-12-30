import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'album_options_state.dart';
import 'model/album_options_arguments.dart';

class AlbumOptionsViewModel extends StateNotifier<AlbumOptionsState> {
  AlbumOptionsViewModel() : super(AlbumOptionsState());

  void init(AlbumOptionArguments arguments) {}

  void download() {
    state = state.copyWith(
      isDownloading: true,
    );
  }
}
