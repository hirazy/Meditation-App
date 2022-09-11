import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_response.freezed.dart';
part 'user_register_response.g.dart';

@freezed
class UserRegisterResponse with _$UserRegisterResponse {
  factory UserRegisterResponse({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
  }) = _UserRegisterResponse;

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);
}
