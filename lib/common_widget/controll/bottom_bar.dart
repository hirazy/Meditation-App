import 'package:flutter/cupertino.dart';

import '../../resource/app_color.dart';
import '../display/item_bottom_navigation.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.items,
    this.onTap,
    this.index = 0,
    Key? key,
  }) : super(key: key);

  /// Current Index
  final int index;

  /// On Handle Click Item
  final Function(int)? onTap;

  /// A list of tabs to display, ie `Home`, `Likes`, etc
  final List<ItemBottomBar> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: context.colors.colorBottomNavigation,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final item in items)
                ItemBottomNavigation(
                  path: item.icon,
                  pathActive: item.activeIcon,
                  isActive: index == items.indexOf(item),
                  onTap: () => onTap?.call(
                    items.indexOf(item),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}

class ItemBottomBar {
  const ItemBottomBar({
    required this.icon,
    required this.activeIcon,
  });

  final String icon;
  final String activeIcon;
}
