import 'package:flutter/material.dart';

import '../../../common_widget/base/base_page.dart';
import '../../../common_widget/icon/icon_base.dart';
import '../../../common_widget/space_box.dart';
import '../../../gen/assets.gen.dart';
import '../../../resource/app_size.dart';
import '../../../resource/app_text_styles.dart';
import '../../../resource/constants.dart';
import 'model/album_arguments.dart';

class AlbumPage extends BasePage {
  const AlbumPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final AlbumArguments arguments;

  @override
  AlbumPageState createState() => AlbumPageState();
}

class AlbumPageState extends BasePageState<AlbumPage> {
  @override
  Color get backgroundColor => Colors.lightBlue;

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1546587348-d12660c30c50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmF0dXJhbHxlbnwwfHwwfHw%3D&w=1000&q=80',
          height: context.sizes.height * 0.6,
          fit: BoxFit.fill,
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              elevation: 0,
              stretchTriggerOffset: context.sizes.height * 0.8,
              stretch: true,
              leading: Row(
                children: [
                  const SpaceBox.width(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        Assets.images.icBackWhite.path,
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                widget.arguments.title,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.fontPoppinsRegular18,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              actions: [
                GestureDetector(
                  onTap: () => showBottomOptions(),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: IconBase(
                      path: Assets.images.icOptions.path,
                      size: 22,
                    ),
                  ),
                ),
                const SpaceBox.width(
                  Constants.spaceWidth,
                ),
              ],
              flexibleSpace: const SpaceBox.height(200),
              expandedHeight: context.sizes.height * 0.45,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    height: 1500,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        Constants.spaceWidth,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Daily Calm HighLights',
                                    style: AppTextStyles.fontPoppinsRegular22
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: InkWell(
                                    customBorder: const CircleBorder(),
                                    onTap: () {},
                                    splashColor: Colors.red,
                                    child: IconBase(
                                      path: Assets.images.icUnfavorite.path,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                    Constants.icAvatar,
                                  ),
                                ),
                                const SpaceBox.width(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hirazy123',
                                        style: AppTextStyles
                                            .fontPoppinsRegular13
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Head of Mindfulness ar Calm',
                                        style: AppTextStyles
                                            .fontPoppinsRegular13
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                IconBase(
                                  path: Assets.images.icNext.path,
                                  size: 18,
                                ),
                              ],
                            ),
                            const SpaceBox.height(12),
                            InkWell(
                              splashColor: Colors.black26,
                              child: Ink(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.cyan,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconBase(
                                              path: Assets.images.icPlay.path,
                                              size: 18,
                                            ),
                                            const SpaceBox.width(12),
                                            Text(
                                              'Play',
                                              style: AppTextStyles
                                                  .fontPoppinsRegular14
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SpaceBox.height(12),
                            Text(
                              'A sample collection of popular Daily Calm sessions',
                              style:
                                  AppTextStyles.fontPoppinsRegular14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              leading: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daily Calm Introduction',
                                    style: AppTextStyles.fontPoppinsRegular14
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '10 min',
                                    style: AppTextStyles.fontPoppinsRegular14
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              trailing: GestureDetector(
                                child: IconBase(
                                  path: Assets.images.icUnfavorite.path,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  void showBottomOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: const [
            Text('Hello'),
          ],
        );
      },
    );
  }
}
