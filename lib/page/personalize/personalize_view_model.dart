import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/api/personalize.dart';
import '../../data/repository/personalize_repository/personalize_repository.dart';
import 'model/personalize_item.dart';
import 'personalize_state.dart';

class PersonalizeViewModel extends StateNotifier<PersonalizeState> {
  PersonalizeViewModel({
    required this.read,
    required this.personalizeRepository,
  }) : super(PersonalizeState());

  final Reader read;
  final PersonalizeRepository personalizeRepository;

  Future<void> init() async {
    final personalizes = <PersonalizeItem>[];
    for (var i = 0; i < 10; i++) {
      personalizes.add(
        PersonalizeItem(
          isSelected: false,
          item: Personalize(
            id: '',
            name: '',
          ),
        ),
      );
    }

    state = state.copyWith(
      personalizes: personalizes,
    );
  }

  void changeItemSelected(int index) {
    final listPersonalizes = state.personalizes;
    listPersonalizes[index].isSelected = !listPersonalizes[index].isSelected;
    state = state.copyWith(
      personalizes: listPersonalizes,
    );
  }
}
