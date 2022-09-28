import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/personalize_repository/personalize_repository.dart';
import 'personalize_state.dart';

class PersonalizeViewModel extends StateNotifier<PersonalizeState> {
  PersonalizeViewModel({
    required this.read,
    required this.personalizeRepository,
  }) : super(PersonalizeState());

  final Reader read;
  final PersonalizeRepository personalizeRepository;

  Future<void> init() async {
    final response = await personalizeRepository.getPersonalizes();
    response.when(
      (data) {
        state = state.copyWith(
          personalizes: data,
        );
      },
      exception: (exception) {
        /// Update Message Error
      },
    );
  }
}
