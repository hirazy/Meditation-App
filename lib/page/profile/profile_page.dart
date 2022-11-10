import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/chart/base_bar_chart.dart';
import '../../common_widget/icon/icon_base.dart';
import '../../common_widget/space_box.dart';
import '../../data/repository/profile_repository/profile_repository.dart';
import '../../gen/assets.gen.dart';
import '../../resource/app_text_styles.dart';
import '../../resource/constants.dart';
import 'model/enum/profile_cell.dart';
import 'model/profile_cell_model.dart';
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
  Color get backgroundColor => Colors.blueAccent;

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
    final cells = ref.watch(_provider).cells;

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
          const SpaceBox.height(15),
          AspectRatio(
            aspectRatio: 1.7,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: Constants.spaceWidth,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: const BaseBarChart(),
            ),
          ),
          const SpaceBox.height(15),
          _buildSection(cells),
          const SpaceBox.height(Constants.paddingHeightBottom),
        ],
      ),
    );
  }
}

extension ProfilePageStateComponent on ProfilePageState {
  Widget _buildSection(List<ProfileCellModel> cells) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...cells.map(_buildCell).toList(),
      ],
    );
  }

  Widget _buildCell(ProfileCellModel cellModel) {
    switch (cellModel.type) {
      case ProfileCellType.static:
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 16,
              right: 16,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.indigoAccent,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _getTitle(cellModel.cell),
                    style: AppTextStyles.fontPoppinsRegular15
                        .copyWith(color: Colors.white),
                  ),
                ),
                IconBase(
                  path: Assets.images.icNext.path,
                  size: 18,
                ),
              ],
            ),
          ),
        );
      case ProfileCellType.interactive:
        return GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(
              top: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        _getTitle(cellModel.cell),
                        style: AppTextStyles.fontPoppinsRegular15.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    }
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
