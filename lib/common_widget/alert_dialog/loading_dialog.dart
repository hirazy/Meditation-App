import 'package:flutter/material.dart';

import '../../resource/app_color.dart';
import '../../resource/app_text_styles.dart';
import '../space_box.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: context.colors.lightBlue,
              ),
            ),
            const SpaceBox.height(20),
            Text(
              message,
              style: AppTextStyles.fontOverpassRegular14,
            ),
          ],
        ),
      ),
    );
  }
}
