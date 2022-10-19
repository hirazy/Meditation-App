import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../resource/app_size.dart';
import '../space_box.dart';

class CardSmall extends StatelessWidget {
  const CardSmall({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.lightBlue,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.asset(
                  Assets.images.imgNature.path,
                  height: context.sizes.width / 3,
                  width: context.sizes.width / 3,
                  fit: BoxFit.cover,
                ),
              ), 
              SpaceBox.height(),
              Text('Hihi')
            ],
          ),
        ),
      ),
    );
  }
}
