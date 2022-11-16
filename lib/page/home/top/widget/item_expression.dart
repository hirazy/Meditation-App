import 'package:flutter/material.dart';

import '../../../../common_widget/icon/icon_base.dart';
import '../../../../common_widget/space_box.dart';
import '../../../../resource/app_text_styles.dart';
import '../model/user_expression.dart';

class ItemExpression extends StatelessWidget {
  const ItemExpression({
    required this.item,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// Call Back
  final VoidCallback onTap;

  /// [UserExpression]
  final UserExpression item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
      ),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color.fromARGB(179, 137, 132, 132),
                shape: BoxShape.circle,
              ),
              child: IconBase(
                path: item.path,
                size: 22,
              ),
            ),
            const SpaceBox.height(),
            Text(
              item.expression,
              style: AppTextStyles.fontOpenSansBold14.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
