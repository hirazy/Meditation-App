import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/app_error.dart';
import 'model/confirm_password.dart';
import 'model/password.dart';
import 'model/username.dart';

part 'sign_up_top_state.freezed.dart';

@freezed
class SignUpTopState with _$SignUpTopState {
  factory SignUpTopState({
    required UserName userName,
    required Password password,
    required ConfirmPassword confirmPassword,
    required FormzStatus formStatus,
    AppError? error,
  }) = _SignUpTopState;

  factory SignUpTopState.initial() => SignUpTopState(
        userName: const UserName.pure(),
        password: const Password.pure(),
        confirmPassword: const ConfirmPassword.pure(),
        formStatus: FormzStatus.pure,
        error: null,
      );
}
