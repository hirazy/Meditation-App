import 'package:flutter/widgets.dart';

class IconBase extends StatelessWidget {
  const IconBase({
    required this.path,
    this.size,
    this.fit = BoxFit.contain,
    Key? key,
  }) : super(key: key);

  /// Path of icon
  final String path;

  /// Size of icon
  final double? size;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: size ?? 18,
      width: size ?? 18,
      fit: fit,
    );
  }
}
