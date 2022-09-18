import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_response.freezed.dart';
part 'user_register_response.g.dart';

@freezed
class UserRegisterResponse with _$UserRegisterResponse {
  factory UserRegisterResponse({
    @JsonKey(name: 'result') required String result,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'errmsg') String? errMsg,

  }) = _UserRegisterResponse;

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);
}
