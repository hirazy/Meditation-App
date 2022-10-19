import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widget/base/base_page.dart';
import 'music_top_state.dart';
import 'music_top_view_model.dart';

final _provider =
    StateNotifierProvider.autoDispose<MusicTopViewModel, MusicTopState>(
  (ref) => MusicTopViewModel(),
);

class MusicTopPage extends BasePage {
  const MusicTopPage({Key? key}) : super(key: key);

  @override
  MusicTopPageState createState() => MusicTopPageState();
}

class MusicTopPageState extends BasePageState<MusicTopPage> {
  @override
  Widget body(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
    );
  }
}
