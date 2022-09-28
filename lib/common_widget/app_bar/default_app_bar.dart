import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  /// Title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
