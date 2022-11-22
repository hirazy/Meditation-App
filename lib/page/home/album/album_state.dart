import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_state.freezed.dart';

@freezed
class AlbumState with _$AlbumState {
  factory AlbumState({
    @Default(0) int index,
  }) = _AlbumState;

  const AlbumState._();
}
