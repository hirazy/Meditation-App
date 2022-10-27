import 'package:flutter/material.dart';

import '../../resource/constants.dart';
import '../space_box.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SpaceBox.width(
            Constants.spaceWidth,
          ),
          ...children
        ],
      ),
    );
  }
}
