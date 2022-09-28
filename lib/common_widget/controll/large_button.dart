import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/enum/button_state.dart';
import '../../resource/app_color.dart';

/// [LargeButton] is button with expanded width screen
class LargeButton extends StatelessWidget {
  const LargeButton({
    required this.title,
    required this.onTap,
    this.prefixIcon,
    this.buttonState = ButtonState.active,
    Key? key,
  }) : super(key: key);

  /// [title]
  final String title;

  /// [onTap] handle event click of button
  final Function() onTap;

  /// Asset path Icon
  final String? prefixIcon;

  /// Button State
  final ButtonState buttonState;

  Color backgroundColor(BuildContext context) {
    switch (buttonState) {
      case ButtonState.active:
        return context.colors.lightBlue;
      case ButtonState.inactive:
        return context.colors.disable;
      case ButtonState.loading:
        return context.colors.lightBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: context.colors.gradientLargeButton,
          ),
          color: backgroundColor(context),
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
              style: GoogleFonts.overpass(
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
