import 'package:flutter/material.dart';

class CardSmall extends StatelessWidget {
  const CardSmall({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(radius),
          color: Colors.lightBlue,
        ),
        child: Row(
          children: [
            
          ],
        ),
      ),
    );
  }
}
