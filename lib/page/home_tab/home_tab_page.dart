import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/bottom_bar.dart';
import '../../resource/constants.dart';
import '../home/home_page.dart';
import '../meditation/meditation_page.dart';
import '../music/top/music_top_page.dart';
import '../profile/profile_page.dart';
import '../sleep/sleep_page.dart';
import 'home_tab_state.dart';
import 'home_tab_view_model.dart';

final _provider =
    StateNotifierProvider.autoDispose<HomeTabViewModel, HomeTabState>(
  (ref) => HomeTabViewModel(),
);

class HomeTabPage extends BasePage {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  HomeTabPageState createState() => HomeTabPageState();
}

class HomeTabPageState extends BasePageState<HomeTabPage> {
  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget body(BuildContext context) {
    return _Body(
      read: ref.read,
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.read,
  });

  final Reader read;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        pageTab(ref),
        bottomNavigation(
          context,
          ref,
        ),
      ],
    );
  }

  Widget pageTab(WidgetRef ref) {
    return IndexedStack(
      index: ref.watch(_provider).index,
      children: const [
        HomePage(),
        MusicTopPage(),
        SleepPage(),
        MeditationPage(),
        ProfilePage(),
      ],
    );
  }

  Widget bottomNavigation(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Positioned(
      bottom: 20,
      child: BottomBar(
        items: Constants.bottomNavigationItems,
        index: ref.watch(_provider).index,
        onTap: (index) {
          ref.read(_provider.notifier).changeIndex(index);
        },
      ),
    );
  }
}
