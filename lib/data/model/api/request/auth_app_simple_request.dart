import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_app_simple_request.freezed.dart';

@freezed
class AuthAppSimpleRequest with _$AuthAppSimpleRequest {
  factory AuthAppSimpleRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'password') required String password,
  }) = _AuthAppSimpleRequest;
}
