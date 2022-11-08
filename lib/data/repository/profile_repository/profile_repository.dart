import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../page/profile/model/enum/profile_cell.dart';
import '../../../page/profile/model/profile_cell_model.dart';
import '../repository.dart';

class ProfileRepository extends Repository {
  ProfileRepository({
    required this.reader,
  }) : super(reader);

  Reader reader;

  Future<List<ProfileCellModel>> getAllProfileCells() async {
    return [
      ProfileCellModel(
        cell: ProfileCell.settings,
        type: ProfileCellType.static,
      ),
      ProfileCellModel(
        cell: ProfileCell.editProfile,
        type: ProfileCellType.static,
      ),
      ProfileCellModel(
        cell: ProfileCell.myMeditation,
        type: ProfileCellType.static,
      ),
      ProfileCellModel(
        cell: ProfileCell.inviteFriends,
        type: ProfileCellType.static,
      ),
      ProfileCellModel(
        cell: ProfileCell.ossLicense,
        type: ProfileCellType.interactive,
      ),
    ];
  }
}
