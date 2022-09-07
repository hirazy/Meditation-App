import 'package:flutter/material.dart';

import '../../resource/app_color.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function() onTap;

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
          color: AppColor.light.lightBlue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
