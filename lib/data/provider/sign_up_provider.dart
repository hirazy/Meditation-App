import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/sign_up/top/sign_up_top_state.dart';
import '../../page/sign_up/top/sign_up_top_view_model.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../repository/user_repository/user_repository.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpTopViewModel, SignUpTopState>(
  (ref) => SignUpTopViewModel(
    userRepository: UserRepository(ref.read),
    authenticationRepository: AuthenticationRepository(ref.read),
    read: ref.read,
  ),
);
