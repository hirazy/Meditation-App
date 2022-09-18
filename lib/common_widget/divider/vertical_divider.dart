import 'package:flutter/material.dart';

import '../../resource/app_color.dart';

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({
    this.width,
    this.color,
    Key? key,
  }) : super(key: key);

  final double? width;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: width ?? 0.5,
      color: color ?? context.colors.border,
    );
  }
}
