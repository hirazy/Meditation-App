import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class StarNightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointStar = Paint()
      ..color = const Color(0xff63aa65)
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 10;

    final points = <Offset>[];
    for (var i = 0; i < 15; i++) {
      final randomPointX = 80.0 + Random().nextInt(120);
      final randomPointY = 100.0 + Random().nextInt(50);
      points.add(Offset(randomPointX, randomPointY));
    }

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50);

    canvas.drawPoints(PointMode.points, points, pointStar);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
