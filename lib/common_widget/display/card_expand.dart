import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardExpand extends StatelessWidget {
  const CardExpand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '',
              ),
            )
          ],
        ),
      ],
    );
  }
}
