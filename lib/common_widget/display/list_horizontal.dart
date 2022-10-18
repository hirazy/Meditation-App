import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children,
      ),
    );
  }
}
