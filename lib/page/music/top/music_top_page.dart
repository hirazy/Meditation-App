import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/base/base_page.dart';
import '../../../common_widget/custom/box_decoration_painter.dart';
import '../../../common_widget/display/list_horizontal.dart';
import '../../../common_widget/input_part/search_area.dart';
import '../../../common_widget/space_box.dart';
import '../../../resource/app_size.dart';
import '../../../resource/app_text_styles.dart';
import '../../../resource/constants.dart';
import '../../home/model/user_expression.dart';
import 'music_top_state.dart';
import 'music_top_view_model.dart';
import 'widgets/music_category_card.dart';
import 'widgets/song_play_card.dart';
import 'widgets/sound_nature_card.dart';

final _provider =
    StateNotifierProvider.autoDispose<MusicTopViewModel, MusicTopState>(
  (ref) => MusicTopViewModel(),
);

class MusicTopPage extends BasePage {
  const MusicTopPage({Key? key}) : super(key: key);

  @override
  MusicTopPageState createState() => MusicTopPageState();
}

class MusicTopPageState extends BasePageState<MusicTopPage> {
  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  Color get backgroundColor => Colors.white;

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        backgroundBody(),
        const _BackgroundFilter(),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Constants.spaceWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.music,
                style: AppTextStyles.fontPoppinsBold20.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.listenRelax,
                style: AppTextStyles.fontPoppinsRegular14.copyWith(
                  color: Colors.white,
                ),
              ),
              const SpaceBox.height(10),
              SearchArea(onTap: () {}),
              const SpaceBox.height(16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SongPlayCard(
                        onTap: () {},
                        onChanged: (value) {},
                      ),
                      const SpaceBox.height(10),
                      Text(
                        AppLocalizations.of(context)!.soundOfNature,
                        style: AppTextStyles.fontPoppinsRegular14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SpaceBox.height(10),
                      ListHorizontal(
                        children: expressions
                            .map(
                              (e) => SoundNatureCard(
                                onTap: () {},
                              ),
                            )
                            .toList(),
                      ),
                      const SpaceBox.height(10),
                      Text(
                        AppLocalizations.of(context)!.music,
                        style: AppTextStyles.fontPoppinsRegular14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SpaceBox.height(10),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: context.sizes.height * 1 / 5 + 50,
                        ),
                        itemCount: expressions.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MusicCategoryCard(
                            onTap: () {},
                          );
                        },
                      ),
                      const SpaceBox.height(
                        Constants.paddingHeightBottom,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget backgroundBody() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF4579F8),
                Color(0xFF4876E7),
                Color(0xFF3255AA),
                Color(0xFF2147A1),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SpaceBox.height(context.sizes.height * 1 / 6),
            Expanded(
              child: ClipPath(
                clipper: const BoxDecorationPainter(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0),
          ],
          stops: const [0.0, 0.4, 0.6],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
      ),
    );
  }
}
