import 'package:flutter/material.dart';

import '../../../common_widget/app_bar/default_app_bar.dart';
import '../../../common_widget/base/base_page.dart';
import '../../../common_widget/space_box.dart';
import '../../../resource/app_size.dart';
import '../../../resource/constants.dart';
import '../../music/top/widgets/music_category_card.dart';
import '../top/model/user_expression.dart';
import 'model/view_all_list_arguments.dart';

class ViewAllListPage extends BasePage {
  const ViewAllListPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final ViewAllListArguments arguments;

  @override
  ViewAllListPageState createState() => ViewAllListPageState();
}

class ViewAllListPageState extends BasePageState<ViewAllListPage> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => DefaultAppBar(
        onLeftTapped: () {
          Navigator.of(context).pop();
        },
        title: widget.arguments.title,
      );

  @override
  Color get backgroundColor => Colors.blueAccent;

  @override
  Widget body(BuildContext context) {
    return RefreshIndicator(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spaceWidth,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: context.sizes.height * 1 / 5 + 50,
                ),
                itemCount: expressions.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return MusicCategoryCard(
                    onTap: () {},
                  );
                },
              ),
            ),
            const SpaceBox.height(12),
          ],
        ),
      ),
      onRefresh: () async {},
    );
  }
}
