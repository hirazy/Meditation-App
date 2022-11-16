import 'package:flutter/material.dart';

class MediumCard extends StatelessWidget {
  const MediumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            child: Image.asset(''),
          ),
          const Text('Hello'),
          const Text('123'),
        ],
      ),
    );
  }
}
