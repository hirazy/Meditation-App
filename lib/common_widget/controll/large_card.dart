import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../gen/assets.gen.dart';
import '../../resource/app_size.dart';
import '../../resource/app_text_styles.dart';
import '../icon/icon_base.dart';
import '../space_box.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({
    required this.title,
    required this.content,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// Title
  final String title;

  /// Content
  final String content;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: Image.asset(
                    Assets.images.imgNature1.path,
                    width: context.sizes.width * 2 / 3,
                    height: context.sizes.width * 2 / 3,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(179, 98, 98, 98),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.termNew,
                      style: AppTextStyles.fontOverpassRegular14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 15,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(179, 98, 98, 98),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: IconBase(
                      path: Assets.images.icLock.path,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SpaceBox.height(),
            Container(
              constraints: BoxConstraints(
                maxWidth: context.sizes.width * 2 / 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.fontOpenSansRegular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '3 minutes',
                          style: AppTextStyles.fontOpenSansRegular13.copyWith(
                            color: const Color.fromARGB(245, 144, 144, 144),
                          ),
                        ),
                        TextSpan(
                          text: ' • ',
                          style: AppTextStyles.fontOpenSansRegular13.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '3 minutes',
                          style: AppTextStyles.fontOpenSansRegular13.copyWith(
                            color: const Color.fromARGB(245, 144, 144, 144),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
