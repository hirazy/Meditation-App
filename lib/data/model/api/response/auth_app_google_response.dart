import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_app_google_response.freezed.dart';

@freezed
class AuthAppGoogleResponse with _$AuthAppGoogleResponse {
  factory AuthAppGoogleResponse({
    @JsonKey(name: 'result') required String result,
    @JsonKey(name: 'errmsg') String? errmsg,
  }) = _AuthAppGoogleResponse;

  const AuthAppGoogleResponse._();
}
