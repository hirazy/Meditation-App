import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../resource/app_size.dart';
import '../../../../resource/app_text_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    required this.urlBackground,
    required this.title,
    required this.onLeftTap,
    required this.buildBody,
    required this.appBarColor,
    Key? key,
  }) : super(key: key);

  /// [title]
  final String title;

  /// [urlBackground]
  final String urlBackground;

  /// [appBarColor]
  final Color appBarColor;

  /// [onLeftTap]
  final VoidCallback onLeftTap;

  /// [buildBody] body of sliver appbar
  final Widget buildBody;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(
                title: title,
                urlBackground: urlBackground,
                expandedHeight: context.sizes.height * 0.45,
                onLeftTap: onLeftTap,
                appBarColor: appBarColor,
              ),
              pinned: true,
            ),
            buildBody,
          ],
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomSliverAppBarDelegate({
    required this.urlBackground,
    required this.title,
    required this.expandedHeight,
    required this.onLeftTap,
    required this.appBarColor,
  });

  ///
  final String title;

  /// [urlBackground]
  final String urlBackground;

  ///
  final VoidCallback onLeftTap;

  /// [expandedHeight]
  final double expandedHeight;

  /// [appBarColor]
  final Color appBarColor;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor:
              appear(shrinkOffset) >= 0.8 ? appBarColor : Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: onLeftTap,
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              height: 16,
              padding: const EdgeInsets.all(3),
              child: Image.asset(
                Assets.images.icBackWhite.path,
                height: 5,
                width: 5,
              ),
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.fontPoppinsRegular15.copyWith(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          urlBackground,
          fit: BoxFit.cover,
        ),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
