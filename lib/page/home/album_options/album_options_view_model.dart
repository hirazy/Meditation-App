import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'album_options_state.dart';
import 'model/album_options_arguments.dart';

const double defaultHeightOfModal = 160;

class AlbumOptionsViewModel extends StateNotifier<AlbumOptionsState> {
  AlbumOptionsViewModel() : super(AlbumOptionsState());

  void init(AlbumOptionArguments arguments) {}

  void download() {
    state = state.copyWith(
      isDownloading: true,
    );
  }

  void changeHeightOfModal(heightOfKeyboard) {
    state = state.copyWith(
      heightOfModal: heightOfKeyboard + defaultHeightOfModal,
    );
  }
}
