import 'package:freezed_annotation/freezed_annotation.dart';

import '../../db/db_tables.dart';
import 'db_base_model.dart';

part 'db_login_info.freezed.dart';

part 'db_login_info.g.dart';

@freezed
class DbLoginInfo extends DbBaseModel with _$DbLoginInfo {
  factory DbLoginInfo({
    @JsonKey(name: DbLoginInfoFields.username) required String username,
    @JsonKey(name: DbLoginInfoFields.password) required String password,
    @JsonKey(name: DbLoginInfoFields.id) String? id,
  }) = _DbLoginInfo;

  factory DbLoginInfo.fromJson(Map<String, dynamic> json) =>
      _$DbLoginInfoFromJson(json);
}
