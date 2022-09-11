import 'package:flutter/material.dart';

import '../../resource/app_color.dart';

/// [LargeButton] is button with expanded width screen
class LargeButton extends StatelessWidget {
  const LargeButton({
    required this.title,
    required this.onTap,
    this.prefixIcon,
    this.backgroundColor = AppColor.bgLightBtn,
    Key? key,
  }) : super(key: key);

  /// [title]
  final String title;

  /// [onTap] handle event click of button
  final Function() onTap;

  /// Asset path Icon
  final String? prefixIcon;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Image.asset(
                prefixIcon!,
                height: 20,
                width: 20,
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
