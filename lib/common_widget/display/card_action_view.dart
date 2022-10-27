import 'package:flutter/material.dart';

import '../../resource/app_text_styles.dart';
import '../../resource/constants.dart';
import '../icon/icon_base.dart';
import '../space_box.dart';

class CardActionView extends StatelessWidget {
  const CardActionView({
    required this.title,
    required this.content,
    required this.onTap,
    this.image,
    this.iconAction,
    Key? key,
  }) : super(key: key);

  /// image
  final String? image;

  /// title
  final String title;

  /// content
  final String content;

  /// icon Action
  final String? iconAction;

  /// Handle Tap
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: Constants.spaceWidth,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.purpleAccent,
              Colors.purple,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null) Image.asset(image!),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.fontPoppinsRegular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SpaceBox.height(5),
                  Text(
                    content,
                    style: AppTextStyles.fontPoppinsRegular14.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceBox.width(10),
            if (iconAction != null)
              IconBase(
                path: iconAction!,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
