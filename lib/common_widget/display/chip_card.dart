import 'package:flutter/material.dart';

import '../../resource/app_text_styles.dart';

class ChipCard extends StatelessWidget {
  const ChipCard({
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  /// [onTap]
  final VoidCallback onTap;

  /// [title]
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF262121),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: AppTextStyles.fontPoppinsRegular14.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
