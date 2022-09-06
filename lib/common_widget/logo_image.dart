import 'package:flutter/widgets.dart';

import '../gen/assets.gen.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    this.size = 200,
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Assets.images.icLogo.image(
      width: size,
      height: size,
    );
  }
}
