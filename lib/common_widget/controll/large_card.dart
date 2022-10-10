import 'package:flutter/material.dart';

import '../icon/icon_base.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  /// Title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [],
            ),
          ),
          IconBase(
            path: '',
          ),
        ],
      ),
    );
  }
}
