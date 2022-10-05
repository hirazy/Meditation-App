import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../common_widget/base/base_page.dart';
import '../../../common_widget/display/image_blur.dart';
import '../../../data/repository/user_repository/user_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../navigation/app_route.dart';
import '../../../resource/app_text_styles.dart';
import 'sign_up_setting_state.dart';
import 'sign_up_setting_view_model.dart';

final _provider = StateNotifierProvider.autoDispose<SignUpUpSettingViewModel,
    SignUpSettingState>(
  (ref) => SignUpUpSettingViewModel(
    userRepository: UserRepository(ref.read),
    reader: ref.read,
  ),
);

/// Screen Code: [SignUpSettingPage]
class SignUpSettingPage extends BasePage {
  const SignUpSettingPage({Key? key}) : super(key: key);

  @override
  SignUpSettingPageState createState() => SignUpSettingPageState();
}

class SignUpSettingPageState extends BasePageState<SignUpSettingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final responseInit = await ref.read(_provider.notifier).init();
      if (responseInit) {
        Navigator.of(context).pushNamed(AppRoute.home);
      }
    });
  }

  @override
  Widget body(BuildContext context) {
    final state = ref.watch(_provider);
    return _Body();
  }
}

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: ImageBlur(
                path: Assets.images.imgSignUpSetting.path,
                sigmaBlur: 3,
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: Lottie.asset(
            Assets.raws.animMeditation,
            height: 250,
            width: 250,
            animate: true,
            repeat: true,
          ),
        ),
        Positioned(
          bottom: 20,
          child: Text(
            AppLocalizations.of(context)!.settingUp,
            style: AppTextStyles.fontPoppinsRegular14.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
