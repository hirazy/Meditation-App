import 'package:freezed_annotation/freezed_annotation.dart';

import 'model/user_name.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default('') UserName username,
    @Default('') String password,
  }) = _LoginState;

  const LoginState._();

  factory LoginState.initial() => LoginState(
    username: UserName.pure(''),
  );
}
