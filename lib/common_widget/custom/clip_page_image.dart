import 'package:flutter/material.dart';

/// [ClipPageImage] Custom Draw Image
class ClipPageImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    final controlPoint = Offset(size.width / 4, size.height);
    final endPoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    final controlPoint2 = Offset(size.width * 3 / 4, size.height);
    final endPoint2 = Offset(size.width, size.height - 50);

    path.quadraticBezierTo(
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint2.dx,
      endPoint2.dy,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
