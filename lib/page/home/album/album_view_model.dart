import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/album_repository/album_repository.dart';
import 'album_state.dart';

class AlbumViewModel extends StateNotifier<AlbumState> {
  AlbumViewModel({
    required this.albumRepository,
  }) : super(AlbumState());

  final AlbumRepository albumRepository;

  void init() {}

  Future<void> playAlbum() async {
    await albumRepository.handleMediaAction();
  }
}
