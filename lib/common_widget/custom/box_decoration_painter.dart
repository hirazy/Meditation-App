import 'package:flutter/material.dart';

class BoxDecorationPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(
      0,
      140,
    );

    const controlPoint2 = Offset(0, 100);
    final endPoint2 = Offset(size.width / 5, 100);

    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint2.dx,
      endPoint2.dy,
    );

    path.lineTo(
      size.width - size.width / 5,
      100,
    );

    final controlPoint3 = Offset(size.width, 100);
    final endPoint3 = Offset(size.width, 60);

    path.quadraticBezierTo(
      controlPoint3.dx,
      controlPoint3.dy,
      endPoint3.dx,
      endPoint3.dy,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
