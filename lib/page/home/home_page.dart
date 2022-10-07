import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/bottom_bar.dart';
import '../../common_widget/display/card_display.dart';
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

class HomePageState extends BasePageState<HomePage> {
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CardDisplay(),
            ],
          ),
        ),
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
