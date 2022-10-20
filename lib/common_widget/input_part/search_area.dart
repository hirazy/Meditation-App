import 'package:flutter/material.dart';

import '../../resource/app_text_styles.dart';
import '../space_box.dart';

class SearchArea extends StatelessWidget {
  const SearchArea({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceBox.width(12),
          const Icon(
            Icons.search,
            color: Colors.white,
          ),
          const SpaceBox.width(12),
          Text(
            'Search',
            style: AppTextStyles.fontPoppinsRegular16.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
