import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/space_box.dart';
import '../../resource/app_color.dart';
import '../../resource/app_text_styles.dart';
import '../../resource/constants.dart';
import 'home_state.dart';
import 'home_view_model.dart';

final _provider = StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(),
);

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BasePageState<HomePage>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // _controller?.startScanning();
        ref.read(_provider.notifier).resumeVideo();
        break;
      case AppLifecycleState.inactive:
        ref.read(_provider.notifier).pauseVideo();
        // _controller?.stopScanning();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(_provider.notifier).init(context);
    });
  }

  @override
  Color? get backgroundColor => context.colors.baseBackgroundColor;

  @override
  Widget body(BuildContext context) {
    return _Body(
      ref: ref,
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_provider);
    return Stack(
      children: [
        if (state.controller != null)
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: VideoPlayer(state.controller!),
          ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SpaceBox.height(
                    MediaQuery.of(context).size.height * 5 / 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          context.colors.baseBackgroundColor.withAlpha(240),
                          context.colors.baseBackgroundColor.withAlpha(255),
                        ],
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: Constants.spaceWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SpaceBox.height(),
                          Text(
                            state.sessionDay,
                            style: AppTextStyles.fontOpenSansBold20.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.workToday,
                            style: AppTextStyles.fontOpenSansBold14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SpaceBox.height(1500),
                          Text('')
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
