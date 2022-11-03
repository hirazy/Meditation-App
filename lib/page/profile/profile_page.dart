import 'package:flutter/material.dart';

import '../../common_widget/base/base_page.dart';
import 'widget/profile_overview_card.dart';

class ProfilePage extends BasePage {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends BasePageState<ProfilePage> {
  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Profile'),
          ProfileOverViewCard(),
        ],
      ),
    );
  }
}
