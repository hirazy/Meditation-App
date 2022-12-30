import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/app_bar/custom_sliver_app_bar.dart';
import '../../../common_widget/base/base_page.dart';
import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../data/provider/modal_bottom_sheet_provider.dart';
import '../../../data/repository/album_repository/album_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_size.dart';
import '../../../resource/app_text_styles.dart';
import '../../../resource/constants.dart';
import '../../../utils/utils.dart';
import '../album_options/album_options_modal.dart';
import '../album_options/model/album_options_arguments.dart';
import 'album_state.dart';
import 'album_view_model.dart';
import 'model/album_arguments.dart';

final albumViewModel = StateNotifierProvider<AlbumViewModel, AlbumState>(
  (ref) => AlbumViewModel(
    albumRepository: AlbumRepository(ref.read),
  ),
);

class AlbumPage extends BasePage {
  const AlbumPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final AlbumArguments arguments;

  @override
  AlbumPageState createState() => AlbumPageState();
}

class AlbumPageState extends BasePageState<AlbumPage> {
  @override
  void onInitState() {
    super.onInitState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      handleAudioPermission();
    });
  }

  @override
  Color get backgroundColor => Colors.lightBlue;

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1546587348-d12660c30c50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmF0dXJhbHxlbnwwfHwwfHw%3D&w=1000&q=80',
          height: context.sizes.height * 0.6,
          fit: BoxFit.fill,
        ),
        CustomSliverAppBar(
          urlBackground: '',
          title: widget.arguments.title,
          onLeftTap: () {
            Navigator.of(context).pop();
          },
          onActionTap: () {
            showBottomOptions();
          },
          appBarColor: Colors.teal,
          buildBody: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 1500,
                        decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            Constants.spaceWidth,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Daily Calm HighLights',
                                        style: AppTextStyles
                                            .fontPoppinsRegular22
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: InkWell(
                                        customBorder: const CircleBorder(),
                                        onTap: () {},
                                        splashColor: Colors.red,
                                        child: IconBase(
                                          path: Assets.images.icUnfavorite.path,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius: 22,
                                      backgroundImage: NetworkImage(
                                        Constants.icAvatar,
                                      ),
                                    ),
                                    const SpaceBox.width(12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Jeff Warren',
                                            style: AppTextStyles
                                                .fontPoppinsRegular13
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Head of Mindfulness or Calm',
                                            style: AppTextStyles
                                                .fontPoppinsRegular13
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconBase(
                                      path: Assets.images.icNext.path,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const SpaceBox.height(12),
                                InkWell(
                                  onTap: () {
                                    // if (await handleAudioPermission()) {
                                    ref
                                        .read(albumViewModel.notifier)
                                        .playAlbum();
                                    // }
                                  },
                                  splashColor: Colors.black26,
                                  child: Ink(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.cyan,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconBase(
                                                  path:
                                                      Assets.images.icPlay.path,
                                                  size: 18,
                                                ),
                                                const SpaceBox.width(12),
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .play,
                                                  style: AppTextStyles
                                                      .fontPoppinsRegular14
                                                      .copyWith(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SpaceBox.height(12),
                                Text(
                                  'A sample collection of popular Daily Calm sessions',
                                  style: AppTextStyles.fontPoppinsRegular14
                                      .copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Daily Calm Introduction',
                                                style: AppTextStyles
                                                    .fontPoppinsRegular14
                                                    .copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '10 min',
                                                style: AppTextStyles
                                                    .fontPoppinsRegular14
                                                    .copyWith(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            Assets.images.icUnfavorite.path,
                                            width: 18,
                                            height: 18,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 1,
                                      color: Colors.white,
                                    );
                                  },
                                  itemCount: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> handleAudioPermission() async {
    var audioPermission = false;
    await Utils.changeAudioFocusPermission(
      changeIsUsingAudioState: (value) {
        audioPermission = value;
      },
      onError: () {},
    );
    return audioPermission;
  }

  void showBottomOptions() {
    ref.read(modalBottomSheetProvider).showModal(
      builder: (context) {
        return AlbumOptionsModal(
          arguments: AlbumOptionArguments(
            albumId: 1,
          ),
        );
      },
    );
  }
}
