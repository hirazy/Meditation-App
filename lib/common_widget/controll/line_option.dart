import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../resource/app_text_styles.dart';

class LineOption extends StatelessWidget {
  const LineOption({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  /// On Tap
  final VoidCallback onTap;

  /// Title Line
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.fontOpenSansBold20.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.seeAll,
              style: AppTextStyles.fontOpenSansRegular14.copyWith(
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
