import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';

class LoginViewModel extends StateNotifier<LoginState>{
  LoginViewModel(): super(LoginState.initial());

  void handleLogin(){

  }

  void changeUsername(String username){

  }
}