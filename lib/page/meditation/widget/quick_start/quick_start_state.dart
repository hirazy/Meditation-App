import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_start_state.freezed.dart';

@freezed
class QuickStartState with _$QuickStartState {
  factory QuickStartState({
    @Default(0) int index,
  }) = _QuickStartState;

  factory QuickStartState.initial() => QuickStartState();
}
