import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/large_card.dart';
import '../../common_widget/controll/line_option.dart';
import '../../common_widget/custom/box_decoration_painter.dart';
import '../../common_widget/display/card_display.dart';
import '../../common_widget/display/card_expand.dart';
import '../../common_widget/divider/horizontal_divider.dart';
import '../../common_widget/space_box.dart';
import '../../resource/app_color.dart';
import '../../resource/app_size.dart';
import '../../resource/app_text_styles.dart';
import '../../resource/constants.dart';
import 'home_state.dart';
import 'home_view_model.dart';
import 'model/user_expression.dart';
import 'widget/item_expression.dart';

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
  late ScrollController _scrollController;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        ref.read(_provider.notifier).resumeVideo();
        break;
      case AppLifecycleState.inactive:
        ref.read(_provider.notifier).pauseVideo();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void onInitState() {
    _scrollController = ScrollController();
    super.onInitState();
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
      scrollController: _scrollController,
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.scrollController,
    required this.ref,
  });

  final ScrollController scrollController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_provider);

    scrollController.addListener(() {
      if (scrollController.offset > 110) {
        ref.read(_provider.notifier).changeExpandedAppBar(true);
      } else {
        ref.read(_provider.notifier).changeExpandedAppBar(false);
      }
    });
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                collapseMode: CollapseMode.parallax,
                background: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: VideoPlayer(state.controller!),
                ),
              ),
            ),
          ],
        ),
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.appName,
                style: AppTextStyles.font.copyWith(
                  color: Colors.white,
                ),
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: state.isExpandedAppBar
                  ? context.colors.baseBackgroundColor
                  : Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: SpaceBox.height(
                  context.sizes.height * 0.1,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: bodyWidget(context, state),
            )
          ],
        ),
      ],
    );
  }

  Widget bodyWidget(BuildContext context, HomeState state) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SpaceBox.height(
                context.sizes.height * 0.1,
              ),
              ClipPath(
                clipper: BoxDecorationPainter(),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.baseBackgroundColor,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Constants.spaceWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceBox.height(
                          120,
                        ),
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
                        const SpaceBox.height(),

                        /// Expression
                        SizedBox(
                          height: 80,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: expressions.length,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const SpaceBox.width(16);
                            },
                            itemBuilder: (context, index) {
                              return ItemExpression(
                                item: expressions[index],
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        const SpaceBox.height(),
                        const HorizontalDivider(),
                        const SpaceBox.height(),
                        /// Recommended
                        LineOption(
                          title: AppLocalizations.of(context)!.recommended,
                          onTap: () {},
                        ),
                        const SpaceBox.height(),
                        SizedBox(
                          height: 230,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const SpaceBox.width();
                            },
                            itemBuilder: (context, index) {
                              return CardExpand(
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        const SpaceBox.height(16),
                        const HorizontalDivider(),
                        const SpaceBox.height(16),
                        /// Today
                        LineOption(
                          title: AppLocalizations.of(context)!.today,
                          onTap: () {},
                        ),
                        const SpaceBox.height(),
                        SizedBox(
                          height: 290,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const SpaceBox.width();
                            },
                            itemBuilder: (context, index) {
                              return LargeCard(
                                title: 'Light Nice Like',
                                content: 'Hihi',
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        const SpaceBox.height(16),
                        const HorizontalDivider(),
                        const SpaceBox.height(16),
                        const SpaceBox.height(),
                        const CardDisplay(),
                        const SpaceBox.height(80),
                        const Text(''),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
