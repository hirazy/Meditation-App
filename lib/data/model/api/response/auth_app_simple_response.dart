import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_app_simple_response.freezed.dart';
part 'auth_app_simple_response.g.dart';

@freezed
class AuthAppSimpleResponse with _$AuthAppSimpleResponse {
  factory AuthAppSimpleResponse({
    @JsonKey(name: 'result') required String result,
    @JsonKey(name: 'errmsg') String? errmsg,
  }) = _AuthAppSimpleResponse;

  const AuthAppSimpleResponse._();

  factory AuthAppSimpleResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthAppSimpleResponseFromJson(json);
}
