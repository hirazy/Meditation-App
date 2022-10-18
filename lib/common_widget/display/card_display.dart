import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../resource/app_text_styles.dart';
import '../../resource/constants.dart';
import '../custom/chart.dart';
import '../space_box.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF2F3677),
                Color(0xFF2772B7),
              ],
            ),
          ),
          child: Stack(
            children: [
              realMeditationText(),
              personIncreasePercent(),
              circleTopRight(),
              circleBottomLeft(),
              backgroundChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget realMeditationText() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Online',
            style: AppTextStyles.fontPoppinsRegular16.copyWith(
              color: Colors.white,
            ),
          ),
          const SpaceBox.height(),
          Text(
            '123,0',
            style: AppTextStyles.fontPoppinsRegular16.copyWith(
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: SpaceBox.height(),
          ),
          Text(
            'Persons Today',
            style: AppTextStyles.fontPoppinsRegular16.copyWith(
              color: Colors.white,
            ),
          ),
          const SpaceBox.height(),
          Text(
            '4500',
            style: AppTextStyles.fontPoppinsRegular16.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget backgroundChart() {
    final minData = Constants.mockChart.reduce(math.min);
    final maxData = Constants.mockChart.reduce(math.max);

    return Chart(
      data: Constants.mockChart,
      minData: minData,
      maxData: maxData,
      minY: 0.99 * minData,
      maxY: 1.01 * maxData,
    );
  }

  Widget personIncreasePercent() {
    return Positioned(
      right: 28,
      bottom: 28,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
      ),
    );
  }

  Widget circleTopRight() {
    return Positioned(
      right: -170,
      // left: -30,
      child: Container(
        width: 260,
        height: 260,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-0.8, -0.7),
            end: Alignment.bottomCenter,
            colors: [
              Color(0x26FFFFFF),
              Color(0x26FFFFFF),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleBottomLeft() {
    return Positioned(
      left: -170,
      top: 30,
      child: Container(
        width: 260,
        height: 260,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-0.8, -0.7),
            end: Alignment.bottomCenter,
            colors: [
              Color(0x26FFFFFF),
              Color(0x26FFFFFF),
            ],
          ),
        ),
      ),
    );
  }
}
