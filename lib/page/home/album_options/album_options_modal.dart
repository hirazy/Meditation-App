import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/base/base_modal_page.dart';
import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_text_styles.dart';
import 'album_options_state.dart';
import 'album_options_view_model.dart';
import 'model/album_options_arguments.dart';

final albumOptionsViewModel =
    StateNotifierProvider.autoDispose<AlbumOptionsViewModel, AlbumOptionsState>(
  (ref) => AlbumOptionsViewModel(),
);

class AlbumOptionsModal extends BaseModalPage {
  const AlbumOptionsModal({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final AlbumOptionArguments arguments;

  @override
  AlbumOptionsModalState createState() => AlbumOptionsModalState();
}

class AlbumOptionsModalState extends BaseModalPageState<AlbumOptionsModal> {
  @override
  double? get modalHeight =>
      ref.watch(albumOptionsViewModel).heightOfModal +
      MediaQueryData.fromWindow(window).padding.bottom;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      final heightOfKeyboard = MediaQuery.of(context).viewInsets.bottom;
      ref
          .read(albumOptionsViewModel.notifier)
          .changeHeightOfModal(heightOfKeyboard);
      ref.read(albumOptionsViewModel.notifier).init(widget.arguments);
    });
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          itemOptions(
            Assets.images.icUnfavorite.path,
            AppLocalizations.of(context)!.favorite,
            () {},
          ),
          itemOptions(
            Assets.images.icShare.path,
            AppLocalizations.of(context)!.share,
            () {},
          ),
          itemOptions(
            Assets.images.icDownload.path,
            ref.watch(albumOptionsViewModel).isDownloading
                ? AppLocalizations.of(context)!.downloading
                : AppLocalizations.of(context)!.download,
            () {
              ref.read(albumOptionsViewModel.notifier).download();
            },
          ),
        ],
      ),
    );
  }

  Widget itemOptions(
    String icPath,
    String title,
    VoidCallback onTap,
  ) {
    return Ink(
      color: Colors.orangeAccent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icPath,
                height: 20,
                width: 20,
              ),
              const SpaceBox.width(15),
              Text(
                title,
                style: AppTextStyles.fontPoppinsRegular16.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
