import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/user_repository/user_repository.dart';
import 'sign_up_setting_state.dart';

class SignUpUpSettingViewModel extends StateNotifier<SignUpSettingState> {
  SignUpUpSettingViewModel({
    required this.userRepository,
    required this.reader,
  }) : super(SignUpSettingState.initial());

  UserRepository userRepository;

  Reader reader;

  Future<bool> init() async {
    final response = await userRepository.setUpPersonalize();

    await Future.delayed(
      const Duration(seconds: 4),
      () {},
    );

    return true;
  }
}
