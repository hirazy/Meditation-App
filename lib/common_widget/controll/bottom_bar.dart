import 'package:flutter/cupertino.dart';

import '../display/item_bottom_navigation.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.items,
    this.index = 0,
    Key? key,
  }) : super(key: key);

  /// Current Index
  final int index;

  /// A list of tabs to display, ie `Home`, `Likes`, etc
  final List<ItemBottomNavigation> items;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
