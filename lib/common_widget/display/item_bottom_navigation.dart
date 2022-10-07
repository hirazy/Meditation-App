import 'package:flutter/cupertino.dart';

import '../icon/icon_base.dart';

class ItemBottomNavigation extends StatelessWidget {
  const ItemBottomNavigation({
    required this.path,
    required this.pathActive,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// Path Image
  final String path;

  /// Status Active
  final bool isActive;

  /// Path Active Image
  final String pathActive;

  /// Handle Click Item
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: IconBase(
          path: isActive ? pathActive : path,
          size: 25,
        ),
      ),
    );
  }
}
