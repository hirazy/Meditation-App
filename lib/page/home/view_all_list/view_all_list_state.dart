import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_all_list_state.freezed.dart';

@freezed
class ViewAllListState with _$ViewAllListState {
  factory ViewAllListState({
    @Default(0) int index,
  }) = _ViewAllListState;
}
