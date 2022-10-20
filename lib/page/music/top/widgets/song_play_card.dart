import 'package:flutter/material.dart';

import '../../../../common_widget/icon/icon_base.dart';
import '../../../../common_widget/space_box.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../resource/app_text_styles.dart';

class SongPlayCard extends StatelessWidget {
  const SongPlayCard({
    required this.onTap,
    required this.onChanged,
    this.valueSlider = 0,
    Key? key,
  }) : super(key: key);

  /// Value Slider
  final double valueSlider;

  /// onChange Value Slider
  final ValueChanged<double> onChanged;

  /// Handle Click
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconBase(
            path: Assets.images.imgNature.path,
            size: 40,
          ),
          const SpaceBox.width(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good sleep after work hard',
                style: AppTextStyles.fontPoppinsRegular16,
              ),
              const SpaceBox.height(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4,
                          thumbShape: const RoundSliderThumbShape(
                            disabledThumbRadius: 4,
                            enabledThumbRadius: 4,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 10,
                          ),
                          activeTickMarkColor: Colors.white.withOpacity(0.2),
                        ),
                        child: Slider(
                          min: 0,
                          max: 100,
                          onChanged: (value) => onChanged(value),
                          value: 0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '0: 00',
                          ),
                          Text(
                            '2: 20',
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
