import 'package:flutter/widgets.dart';

class IconBase extends StatelessWidget {
  const IconBase({
    required this.path,
    this.size,
    Key? key,
  }) : super(key: key);

  final String path;

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: size ?? 18,
      width: size ?? 18,
    );
  }
}
