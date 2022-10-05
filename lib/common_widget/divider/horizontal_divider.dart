import 'package:flutter/material.dart';

import '../../resource/app_color.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    this.height,
    this.color,
    Key? key,
  }) : super(key: key);

  final double? height;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 0.5,
      color: color ?? context.colors.border,
    );
  }
}
