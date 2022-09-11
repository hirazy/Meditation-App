import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/app_bar/logo_app_bar.dart';
import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/large_button.dart';
import '../../common_widget/input_part/input_text_area.dart';
import '../../common_widget/space_box.dart';

class SignUpPage extends BasePage {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends BasePageState<SignUpPage>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  bool get tapOutsideHideKeyboard => true;

  @override
  Widget body(BuildContext context) {
    return const _Body();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LogoAppBar();
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @override
  Widget? buildBottomSheet(BuildContext context) => null;

  @override
  Widget? buildDrawer(BuildContext context) => null;

  @override
  Widget? buildEndDrawer(BuildContext context) => null;
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const InputTextArea(
            initialText: '',
          ),
          const SpaceBox.height(10),
          const InputTextArea(
            initialText: '',
          ),
          const SpaceBox.height(20),
          LargeButton(
            title: AppLocalizations.of(context)!.signUp,
            onTap: () {},
          ),
          const SpaceBox.height(10),
        ],
      ),
    );
  }
}
