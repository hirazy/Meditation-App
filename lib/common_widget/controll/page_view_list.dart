import 'package:flutter/material.dart';

import '../custom/clip_page_image.dart';

/// [PageViewList] is a custom page view
class PageViewList extends StatelessWidget {
  const PageViewList({
    required this.images,
    Key? key,
  }) : super(key: key);

  /// [images] contains all image resources of page view
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: PageView(
        onPageChanged: (index) {},
        children: images
            .map(
              (e) => Container(
                padding: const EdgeInsets.all(10),
                child: buildBackDrop(context, e),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildBackDrop(BuildContext context, String assetImage) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipPath(
            clipper: ClipPageImage(),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 - 50,
                child: Image.asset(
                  assetImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
