import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/app_bar/logo_app_bar.dart';
import '../../common_widget/base/base_page.dart';
import '../../common_widget/controll/large_button.dart';
import '../../data/app_error.dart';
import '../../data/repository/personalize_repository/personalize_repository.dart';
import '../../gen/assets.gen.dart';
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
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const LogoAppBar();
  }

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
                    sigmaX: 2,
                    sigmaY: 2,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: listPersonalize(),
            ),
            LargeButton(
              title: 'Hihi',
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }

  Widget listPersonalize() {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return ItemPersonalize(onTap: () {});
        },
      ),
    );
  }

  Future<void> showErrorDialog(AppError appError) async {
    testAppError(appError);
  }

  void testAppError(AppError appError) {}
}
