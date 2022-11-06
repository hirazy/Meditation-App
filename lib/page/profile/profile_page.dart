import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/space_box.dart';
import '../../data/repository/profile_repository/profile_repository.dart';
import '../../resource/app_text_styles.dart';
import 'model/enum/profile_cell.dart';
import 'profile_state.dart';
import 'profile_view_model.dart';
import 'widget/profile_overview_card.dart';

final _provider =
    StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>(
  (ref) => ProfileViewModel(
    repository: ProfileRepository(reader: ref.read),
    reader: ref.read,
  ),
);

class ProfilePage extends BasePage {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends BasePageState<ProfilePage> {
  Map<ProfileCell, String> _cellTitles = {};

  @override
  void onInitState() {
    super.onInitState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCellTitles();
      ref.read(_provider.notifier).init();
    });
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.profile,
            style: AppTextStyles.fontPoppinsRegular16,
          ),
          const SpaceBox.height(10),
          ProfileOverViewCard(
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCell() {
    return Container();
  }
}

extension ProfileFunction on ProfilePageState {
  String _getTitle(ProfileCell cell) {
    return _cellTitles[cell] ?? '';
  }

  void _getCellTitles() {
    _cellTitles = {
      ProfileCell.settings: AppLocalizations.of(context)!.setting,
      ProfileCell.editProfile: AppLocalizations.of(context)!.editProfile,
      ProfileCell.myMeditation: AppLocalizations.of(context)!.myMediation,
      ProfileCell.inviteFriends: AppLocalizations.of(context)!.inviteFriends,
      ProfileCell.ossLicense: AppLocalizations.of(context)!.licenceTitle,
    };
  }
}
