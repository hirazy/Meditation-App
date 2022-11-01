import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation_state.freezed.dart';

@freezed
class MeditationState with _$MeditationState {
  factory MeditationState({
    @Default(0) int index,
  }) = _MeditationState;

  factory MeditationState.initial() => MeditationState();
}
