import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'album_state.dart';

class AlbumViewModel extends StateNotifier<AlbumState> {
  AlbumViewModel() : super(AlbumState());

  void init() {}
}
