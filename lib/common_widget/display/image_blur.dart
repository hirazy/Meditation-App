import 'dart:ui';

import 'package:flutter/material.dart';

class ImageBlur extends StatelessWidget {
  const ImageBlur({
    required this.path,
    this.sigmaBlur = 5,
    Key? key,
  }) : super(key: key);

  final String path;
  final double sigmaBlur;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaBlur,
          sigmaY: sigmaBlur,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0),
          ),
        ),
      ),
    );
  }
}
