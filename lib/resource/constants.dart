import '../common_widget/controll/bottom_bar.dart';
import '../data/model/api/personalize.dart';
import '../gen/assets.gen.dart';

class Constants {
  Constants._private();

  static const String isDeletedColumn = 'is_deleted';

  static const double spaceWidth = 15;

  static List<Personalize> personalizes = [Personalize(id: '1', name: '')];

  /// Items of Bottom Navigation App
  static List<ItemBottomBar> bottomNavigationItems = [
    ItemBottomBar(
      icon: Assets.images.home.path,
      activeIcon: Assets.images.homeActive.path,
    ),
    ItemBottomBar(
      icon: Assets.images.music.path,
      activeIcon: Assets.images.musicActive.path,
    ),
    ItemBottomBar(
      icon: Assets.images.moon.path,
      activeIcon: Assets.images.moonActive.path,
    ),
    ItemBottomBar(
      icon: Assets.images.lotus.path,
      activeIcon: Assets.images.lotusActive.path,
    ),
    ItemBottomBar(
      icon: Assets.images.account.path,
      activeIcon: Assets.images.accountActive.path,
    ),
  ];

  /// Title Home Page
  static const int isMorning = 0;
  static const int isAfternoon = 1;
  static const int isEvening = 2;

  /// Mock Chart
  static const mockChart = [
    3622.89,
    3678.83,
    3729.68,
    3702.28,
    3926.18,
    3867.67,
    4068.79,
  ];
}
