import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum/profile_cell.dart';

part 'profile_section_model.freezed.dart';

@freezed
class ProfileSectionModel with _$ProfileSectionModel {
  factory ProfileSectionModel({
    required List<ProfileCell> cells,
  }) = _ProfileSectionModel;

  const ProfileSectionModel._();
}
