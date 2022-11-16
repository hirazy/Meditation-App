import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/profile_repository/profile_repository.dart';
import 'profile_state.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel({
    required this.repository,
    required this.reader,
  }) : super(ProfileState());

  final Reader reader;
  final ProfileRepository repository;

  Future<void> init() async {
    final cells = await repository.getAllProfileCells();
    state = state.copyWith(cells: cells);
  }

  // void onCellTap(ProfileCell cell){
  //   switch(cell){
  //     case ProfileCell.settings:
  //       break;
  //   }
  // }
}
