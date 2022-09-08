import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/password.dart';
import 'model/username.dart';
import 'sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(super.state);

  void changeUserName(String userName) {
    state = state.copyWith(
      userName: UserName.dirty(userName),
    );
  }

  void changePassword(String password) {
    state = state.copyWith(
      password: Password.dirty(password),
    );
  }
}
