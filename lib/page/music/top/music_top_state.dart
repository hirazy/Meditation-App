import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_top_state.freezed.dart';

@freezed
class MusicTopState with _$MusicTopState {
  factory MusicTopState({
    @Default(1) int index,
  }) = _MusicTopState;

  factory MusicTopState.initial() => MusicTopState();
}
