import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../page/profile/model/enum/profile_cell.dart';
import '../repository.dart';

class ProfileRepository extends Repository {
  ProfileRepository({
    required this.reader,
  }) : super(reader);

  Reader reader;

  Future<List<ProfileCell>> getAllProfileCells() async {
    return [
      ProfileCell.settings,
      ProfileCell.editProfile,
      ProfileCell.myMeditation,
      ProfileCell.inviteFriends,
    ];
  }
}
