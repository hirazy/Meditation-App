import 'package:flutter/cupertino.dart';

import '../custom/chart.dart';

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
              circleTopRight(),
              circleBottomLeft(),
              backgroundChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget backgroundChart() {
    return const Chart(
      data: [0, 1],
      minData: 0.99,
      maxData: 1.01,
      minY: 0.99,
      maxY: 1.01,
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
