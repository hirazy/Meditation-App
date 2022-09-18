import 'package:flutter/material.dart';

import '../logo_image.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const LogoImage(
        size: 40,
      ),
      centerTitle: false,
      elevation: 0,
      actions: buildAction(),
      automaticallyImplyLeading: false,
    );
  }

  List<Widget>? buildAction() => null;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
