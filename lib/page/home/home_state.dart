import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required int index,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        index: 0,
      );
}
