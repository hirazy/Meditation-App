import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_state.freezed.dart';

@freezed
class SleepState with _$SleepState {
  factory SleepState({
    @Default(0) int index,
  }) = _SleepState;

  factory SleepState.initial() => SleepState(
        index: 0,
      );
}
