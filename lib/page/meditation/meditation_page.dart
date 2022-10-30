import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/app_bar/default_app_bar.dart';
import '../../common_widget/base/base_page.dart';
import '../../common_widget/space_box.dart';
import '../../gen/assets.gen.dart';
import 'meditation_state.dart';
import 'meditation_view_model.dart';
import 'widget/course/course_tab.dart';
import 'widget/quick_start/quick_start_tab.dart';

final _provider =
    StateNotifierProvider.autoDispose<MeditationViewModel, MeditationState>(
  (ref) => MeditationViewModel(),
);

class MeditationPage extends BasePage {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  MeditationPageState createState() => MeditationPageState();
}

class MeditationPageState extends BasePageState<MeditationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  Color get backgroundColor => Colors.orange;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => DefaultAppBar(
        title: AppLocalizations.of(context)!.appName,
        rightIcon: Assets.images.icSearch.path,
        onRightTapped: () {},
      );

  @override
  void onInitState() {
    super.onInitState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(8),
              ),
              unselectedLabelColor: Colors.grey[500],
              tabs: [
                Tab(
                  text: AppLocalizations.of(context)!.course,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.quickStart,
                )
              ],
              onTap: (index) {
                ref.read(_provider.notifier).changeIndex(index);
              },
            ),
          ),
        ),
        const SpaceBox.height(10),
        Expanded(
          child: indexPage(),
        )
      ],
    );
  }

  Widget indexPage() {
    return IndexedStack(
      index: ref.watch(_provider).index,
      children: const [
        CourseTab(),
        QuickStartTab(),
      ],
    );
  }
}
