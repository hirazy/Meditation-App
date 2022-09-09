import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import 'model/password.dart';
import 'model/username.dart';
import 'sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(): super(SignUpState.initial());

  void changeUserName(String value) {
    final userName = UserName.dirty(value);
    state = state.copyWith(
      userName: userName,
    );
  }

  void changePassword(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      formStatus: Formz.validate([]),
    );
  }
}
