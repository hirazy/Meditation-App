import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_size.dart';
import '../../../resource/app_text_styles.dart';
import '../../../resource/constants.dart';

class ProfileOverViewCard extends StatelessWidget {
  const ProfileOverViewCard({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: context.sizes.width / 8,
              right: Constants.spaceWidth,
              left: Constants.spaceWidth,
            ),
            padding: EdgeInsets.only(
              top: context.sizes.width / 8,
              left: Constants.spaceWidth,
              right: Constants.spaceWidth,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Năng Lê',
                  style: AppTextStyles.fontPoppinsBold16.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'nangle12456@gmail.com',
                  style: AppTextStyles.fontPoppinsRegular14.copyWith(
                    color: Colors.white60,
                  ),
                ),
                const SpaceBox.height(15),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: textLabel(
                            AppLocalizations.of(context)!.termTotal,
                            textAlign: TextAlign.start,
                            color: Colors.lightBlue,
                          ),
                        ),
                        Expanded(
                          child: textLabel(
                            '94',
                            color: Colors.lightBlue,
                            fontSize: 16,
                            isBoldText: true,
                          ),
                        ),
                        Expanded(
                          child: textLabel(
                            '94',
                            color: Colors.lightBlue,
                            fontSize: 16,
                            isBoldText: true,
                          ),
                        ),
                        Expanded(
                          child: textLabel(
                            '94',
                            color: Colors.lightBlue,
                            fontSize: 16,
                            isBoldText: true,
                          ),
                        )
                      ],
                    ),
                    const SpaceBox.height(),
                    Row(
                      children: [
                        Expanded(
                          child: textLabel(
                            AppLocalizations.of(context)!.termMonth,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: IconBase(
                            path: Assets.images.icTimeLeft.path,
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: IconBase(
                            path: Assets.images.icHeadphones.path,
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: IconBase(
                            path: Assets.images.icCalendar.path,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SpaceBox.height(),
                    Row(
                      children: [
                        Expanded(
                          child: textLabel(
                            AppLocalizations.of(context)!.termYear,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: textLabel(
                            'Total minutes',
                          ),
                        ),
                        Expanded(
                          child: textLabel(
                            'Total sessions',
                          ),
                        ),
                        Expanded(
                          child: textLabel(
                            'Days in row',
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SpaceBox.height(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CachedNetworkImage(
              imageUrl:
                  'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.6435-1/142915405_106600208107240_8287176908190349092_n.jpg?stp=dst-jpg_p160x160&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_ohc=TRciSk6vfAwAX9ktPDK&tn=y9erCs1Wd2HJw9GZ&_nc_ht=scontent.fhan14-2.fna&oh=00_AfDWIuqy5TMihiLa-peD6yPThcaGdvZ8kuVDf1RhEXw4Yg&oe=638B4B10',
              imageBuilder: (context, image) {
                return Container(
                  height: context.sizes.width / 4,
                  width: context.sizes.width / 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                    ),
                    shape: BoxShape.circle,
                  ),
                );
              },
              progressIndicatorBuilder: (context, url, progress) {
                return const CircularProgressIndicator(
                  color: Colors.blueAccent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget textLabel(
    String value, {
    Color? color,
    TextAlign? textAlign,
    double? fontSize,
    bool? isBoldText,
  }) {
    return Text(
      value,
      style: AppTextStyles.fontPoppinsRegular14.copyWith(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: (isBoldText != null) ? FontWeight.w700 : null,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
