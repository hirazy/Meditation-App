import 'package:freezed_annotation/freezed_annotation.dart';

import 'model/profile_cell_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default([]) List<ProfileCellModel> cells,
  }) = _ProfileState;
}
