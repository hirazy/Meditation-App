import 'package:flutter/material.dart';

import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../resource/app_text_styles.dart';
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
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.teal,
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
            style: AppTextStyles.fontPoppinsRegular16.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
