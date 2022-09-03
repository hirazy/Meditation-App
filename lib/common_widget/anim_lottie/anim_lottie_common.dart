import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class AnimLottieCommon extends StatefulWidget {
  const AnimLottieCommon({
    required this.height,
    required this.width,
    required this.asset,
    this.isAnimated = true,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;
  final String asset;
  final bool isAnimated;

  @override
  AnimLottieCommonState createState() {
    return AnimLottieCommonState();
  }
}

class AnimLottieCommonState extends State<AnimLottieCommon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        widget.asset,
        height: widget.height,
        width: widget.width,
        animate: widget.isAnimated,
        repeat: widget.isAnimated,
      ),
    );
  }
}
