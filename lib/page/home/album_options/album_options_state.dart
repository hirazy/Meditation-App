import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_options_state.freezed.dart';

@freezed
class AlbumOptionsState with _$AlbumOptionsState {
  factory AlbumOptionsState({
    @Default(false) bool isFavorite,
    @Default(false) bool isDownloading,
  }) = _AlbumOptionsState;
}
