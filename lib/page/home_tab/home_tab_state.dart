import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tab_state.freezed.dart';

@freezed
class HomeTabState with _$HomeTabState {
  factory HomeTabState({
    required int index,
  }) = _HomeTabState;

  factory HomeTabState.initial() => HomeTabState(
        index: 0,
      );
}
