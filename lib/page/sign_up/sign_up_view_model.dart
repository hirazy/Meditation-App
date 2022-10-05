import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../data/model/api/request/user_register_request.dart';
import '../../data/model/enum/connection.dart';
import '../../data/repository/authentication_repository/authentication_repository.dart';
import '../../data/repository/user_repository/user_repository.dart';
import 'model/confirm_password.dart';
import 'model/password.dart';
import 'model/username.dart';
import 'sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel({
    required this.userRepository,
    required this.authenticationRepository,
    required this.read,
  }) : super(SignUpState.initial());

  final Reader read;
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;

  void changeUserName(String value) {
    final userName = UserName.dirty(value);
    state = state.copyWith(
      userName: userName,
      formStatus: Formz.validate([
        userName,
        state.password,
        state.confirmPassword,
      ]),
    );
  }

  void changePassword(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      formStatus: Formz.validate([
        state.userName,
        password,
        state.confirmPassword,
      ]),
    );
  }

  void changeConfirmPassword(String value) {
    final confirmPassword = ConfirmPassword.dirty(
      password: state.password.value ?? '',
      value: value,
    );
    state = state.copyWith(
      confirmPassword: confirmPassword,
      formStatus: Formz.validate(
        [
          state.userName,
          state.password,
          confirmPassword,
        ],
      ),
    );
  }

  Future<void> submitSignUp() async {
    state = state.copyWith(
      formStatus: FormzStatus.valid,
    );
    if (!state.formStatus.isValidated) {
      return;
    }
    // if (await getNetworkConnection() == Connection.offline) {}
    state = state.copyWith(
      formStatus: FormzStatus.submissionInProgress,
    );
    final userRegisterRequest = UserRegisterRequest(
      username: state.userName.value ?? '',
      password: state.password.value ?? '',
    );
    final response = await userRepository.signUp(userRegisterRequest);
  }

  Future<Connection> getNetworkConnection() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none ||
        connectivity == ConnectivityResult.bluetooth) {
      return Connection.offline;
    }
    return Connection.online;
  }

  Future<void> signInGmail() async {
    final response = await authenticationRepository.authAppGoogle();
  }
}
