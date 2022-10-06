import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/display/item_bottom_navigation.dart';
import '../../gen/assets.gen.dart';
import '../../resource/app_color.dart';
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

class HomePageState extends BasePageState<HomePage> {

  @override
  Color? get backgroundColor => Colors.red;

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
        bottomNavigation(
          context,
          ref,
        ),
      ],
    );
  }

  Widget bottomNavigation(
    BuildContext context,
    WidgetRef ref,
  ) {
    final index = ref.watch(_provider).index;
    return Positioned(
      bottom: 20,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: context.colors.colorBottomNavigation,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemBottomNavigation(
                  path: Assets.images.icMoon.path,
                  pathActive: Assets.images.icMoonActive.path,
                  onTap: () {
                    read(_provider.notifier).changeIndex(0);
                  },
                  isActive: false,
                ),
                ItemBottomNavigation(
                  path: Assets.images.icAccount.path,
                  pathActive: Assets.images.icAccountActive.path,
                  onTap: () {},
                  isActive: false,
                ),
                ItemBottomNavigation(
                  path: Assets.images.icMoon.path,
                  pathActive: Assets.images.icMoonActive.path,
                  onTap: () {},
                  isActive: true,
                ),
                ItemBottomNavigation(
                  path: Assets.images.icMoon.path,
                  pathActive: Assets.images.icMoonActive.path,
                  onTap: () {},
                  isActive: true,
                ),
                ItemBottomNavigation(
                  path: Assets.images.icMoon.path,
                  pathActive: Assets.images.icMoonActive.path,
                  onTap: () {},
                  isActive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
