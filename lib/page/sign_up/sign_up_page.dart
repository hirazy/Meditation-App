import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../common_widget/app_bar/logo_app_bar.dart';
import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/large_button.dart';
import '../../common_widget/divider/horizontal_divider.dart';
import '../../common_widget/icon/icon_base.dart';
import '../../common_widget/input_part/input_text_area.dart';
import '../../common_widget/space_box.dart';
import '../../data/model/enum/button_state.dart';
import '../../data/provider/sign_up_provider.dart';
import '../../gen/assets.gen.dart';
import '../../navigation/app_route.dart';
import 'model/confirm_password.dart';
import 'model/password.dart';
import 'model/username.dart';

class SignUpPage extends BasePage {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends BasePageState<SignUpPage>
    with WidgetsBindingObserver {
  late StreamController closeKeyBoardStreamController;

  @override
  void onInitState() {
    super.onInitState();
    closeKeyBoardStreamController = StreamController.broadcast();
  }

  @override
  void onDispose() {
    WidgetsBinding.instance.removeObserver(this);
    closeKeyBoardStreamController.close();
    super.onDispose();
  }

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
    return _Body(
      closeKeyBoardStreamController: closeKeyBoardStreamController,
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LogoAppBar();
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.closeKeyBoardStreamController,
    Key? key,
  }) : super(key: key);

  final StreamController closeKeyBoardStreamController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final username = signUpState.userName;
    final password = signUpState.password;
    final confirmPassword = signUpState.confirmPassword;
    final formStatus = signUpState.formStatus;

    return GestureDetector(
      onTap: () => closeKeyBoardStreamController.sink.add(true),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpaceBox.height(30),
              InputTextArea(
                title: AppLocalizations.of(context)!.usernameEmail,
                onChanged: (value) {
                  ref.read(signUpProvider.notifier).changeUserName(value);
                },
                errorText: username.error != null
                    ? (username.error as UserNameValidatorError)
                            .description(context: context) ??
                        ''
                    : null,
              ),
              const SpaceBox.height(10),
              InputTextArea(
                title: AppLocalizations.of(context)!.password,
                onChanged: (value) {
                  ref.read(signUpProvider.notifier).changePassword(value);
                },
                obSecureText: true,
                errorText: password.error != null
                    ? (password.error as PasswordValidatorError)
                            .message(context: context) ??
                        ''
                    : null,
              ),
              const SpaceBox.height(10),
              InputTextArea(
                title: AppLocalizations.of(context)!.confirmPassword,
                onChanged: (value) {
                  ref
                      .read(signUpProvider.notifier)
                      .changeConfirmPassword(value);
                },
                obSecureText: true,
                errorText: confirmPassword.error != null
                    ? (confirmPassword.error as ConfirmPasswordValidatorError)
                            .description(context: context) ??
                        ''
                    : null,
              ),
              const SpaceBox.height(15),
              LargeButton(
                title: AppLocalizations.of(context)!.signUp,
                onTap: () {
                  // ref.read(signUpProvider.notifier).submitSignUp();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoute.personalize,
                    (route) => false,
                  );
                },
                buttonState: formStatus.isValid
                    ? ButtonState.active
                    : ButtonState.inactive,
              ),
              const SpaceBox.height(25),
              _buildDividerLine(context),
              const SpaceBox.height(20),
              _buildGoogleButton(
                context,
                () {
                  ref.read(signUpProvider.notifier).signInGmail();
                },
              ),
              const SpaceBox.height(15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDividerLine(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          const Expanded(
            child: HorizontalDivider(
              height: 1,
              color: Colors.black,
            ),
          ),
          const SpaceBox.width(),
          Text(
            AppLocalizations.of(context)!.signUpWith,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SpaceBox.width(),
          const Expanded(
            child: HorizontalDivider(
              height: 1,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleButton(BuildContext context, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconBase(
          path: Assets.images.icGoogle.path,
          size: 35,
        ),
      ),
    );
  }
}
