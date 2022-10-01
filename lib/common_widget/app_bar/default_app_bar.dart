import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../resource/constants.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.title,
    this.centerTitle,
    this.onLeftTapped,
    this.onRightTapped,
    Key? key,
  }) : super(key: key);

  /// Title
  final String? title;

  /// Center Title
  final String? centerTitle;

  /// on Button Left Tapped
  final VoidCallback? onLeftTapped;

  /// on Button Right Tapped
  final VoidCallback? onRightTapped;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: buildLeftContent(),
    );
  }

  Widget buildLeftContent() {
    return onLeftTapped != null
        ? GestureDetector(
            onTap: onLeftTapped,
            child: Container(
              margin: const EdgeInsets.only(left: Constants.spaceWidth),
              height: kToolbarHeight,
              child: Image.asset(
                Assets.images.icBackWhite.path,
                height: 12,
                width: 12,
              ),
            ),
          )
        : Container();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
