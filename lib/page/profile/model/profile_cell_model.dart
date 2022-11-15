import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/profile_cell.dart';

part 'profile_cell_model.freezed.dart';

@freezed
class ProfileCellModel with _$ProfileCellModel {
  factory ProfileCellModel({
    required ProfileCell cell,
    required ProfileCellType type,
  }) = _ProfileCellModel;

  const ProfileCellModel._();
}

enum ProfileCellType {
  static,
  interactive,
}
