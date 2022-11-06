import 'package:freezed_annotation/freezed_annotation.dart';

import 'model/enum/profile_cell.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default([]) List<ProfileCell> cells,
  }) = _ProfileState;
}
