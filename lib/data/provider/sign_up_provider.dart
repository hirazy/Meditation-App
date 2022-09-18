import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../page/sign_up/sign_up_state.dart';
import '../../page/sign_up/sign_up_view_model.dart';
import '../repository/user_repository/user_repository.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignUpState>(
  (ref) => SignUpViewModel(
    userRepository: UserRepository(ref.read),
    read: ref.read,
  ),
);
