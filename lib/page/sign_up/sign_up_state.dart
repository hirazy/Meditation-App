import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/app_error.dart';
import 'model/password.dart';
import 'model/username.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    required UserName userName,
    required Password password,
    required FormzStatus formStatus,
    AppError? error,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
        userName: UserName.pure(),
        password: Password.pure(),
        formStatus: FormzStatus.pure,
        error: null,
      );
}
