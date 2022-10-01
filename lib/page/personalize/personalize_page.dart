import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/large_button.dart';
import '../../common_widget/icon/icon_base.dart';
import '../../common_widget/space_box.dart';
import '../../data/app_error.dart';
import '../../data/repository/personalize_repository/personalize_repository.dart';
import '../../gen/assets.gen.dart';
import '../../resource/app_text_styles.dart';
import 'personalize_state.dart';
import 'personalize_view_model.dart';
import 'widget/item_personalize.dart';

final _provider =
    StateNotifierProvider.autoDispose<PersonalizeViewModel, PersonalizeState>(
  (ref) => PersonalizeViewModel(
    read: ref.read,
    personalizeRepository: PersonalizeRepository(ref.read),
  ),
);

class PersonalizePage extends BasePage {
  const PersonalizePage({Key? key}) : super(key: key);

  @override
  PersonalizePageState createState() => PersonalizePageState();
}

class PersonalizePageState extends BasePageState<PersonalizePage> {
  @override
  void onInitState() {
    super.onInitState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_provider.notifier).init();
    });
  }

  @override
  bool get tapOutsideHideKeyboard => true;

  @override
  Widget body(BuildContext context) => _Body();
}

class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(_provider, (previous, next) {
      if (next is PersonalizeState &&
          next.error != null &&
          next.error is AppError) {
        showErrorDialog(next.error as AppError);
      }
    });

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                      Assets.images.imgPersonalize.path,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(() {
              Navigator.pop(context);
            }),
            headPersonalize(context),
            Expanded(
              child: listPersonalize(
                ref,
              ),
            ),
            const SpaceBox.height(),
            LargeButton(
              title: AppLocalizations.of(context)!.textContinue,
              onTap: () {},
            ),
            const SpaceBox.height(),
          ],
        ),
      ],
    );
  }

  Widget appBar(VoidCallback onLeftTapped) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SpaceBox.height(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SpaceBox.width(15),
            GestureDetector(
              onTap: onLeftTapped,
              child: IconBase(
                path: Assets.images.icBackWhite.path,
                size: 22,
              ),
            ),
          ],
        ),
        const SpaceBox.height(),
      ],
    );
  }

  Widget headPersonalize(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.tellWhatLove,
            textAlign: TextAlign.left,
            style: AppTextStyles.fontPoppinsBold22.copyWith(
              color: Colors.white,
            ),
          ),
          const SpaceBox.height(10),
        ],
      ),
    );
  }

  Widget listPersonalize(
    WidgetRef ref,
  ) {
    final listPersonalizes = ref.watch(_provider).personalizes;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: listPersonalizes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return ItemPersonalize(
            onTap: () {
              ref.read(_provider.notifier).changeItemSelected(index);
            },
            item: listPersonalizes[index],
          );
        },
      ),
    );
  }

  Future<void> showErrorDialog(AppError appError) async {
    testAppError(appError);
  }

  void testAppError(AppError appError) {}
}
