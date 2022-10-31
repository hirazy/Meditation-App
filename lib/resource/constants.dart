import '../common_widget/controll/bottom_bar.dart';
import '../data/model/api/personalize.dart';
import '../data/model/api/response/course.dart';
import '../data/model/api/response/level_course.dart';
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

  /// Sleep Stories
  static const dummySleepStories = ['All', 'Recommended', 'Fiction', 'M'];

  static const dummySleepCardStories = [];

  static List<LevelCourse> dummyLevelCourses = [
    LevelCourse(
      title: 'Basics of meditation',
      subTitle: 'Before you begin',
      id: '1',
      courses: [
        Course(
          id: '1',
          level: '1',
          banner: '',
          name: 'What is meditation?',
          description:
              'Answer on the most important questions about meditation',
        ),
        Course(
          id: '2',
          level: '1',
          name: 'What is meditation?',
          description:
              'Answer on the most important questions about meditation',
        ),
        Course(
          id: '3',
          level: '1',
          name: 'What is meditation?',
          description:
              'Answer on the most important questions about meditation',
        ),
      ],
    ),
    LevelCourse(
      id: '2',
      title: 'Beginner level',
      subTitle: 'Take the first steps',
      courses: [
        Course(
          id: '1',
          level: '1',
          banner: '',
          name: 'Your first step',
          description: 'First contact with meditation',
        ),
        Course(
          id: '2',
          level: '1',
          name: 'Basic program',
          description: 'A basic course',
        ),
      ],
    ),
    LevelCourse(
      id: '3',
      title: 'Advanced level',
      subTitle: 'Advanced practices for users with experience',
      courses: [
        Course(
          id: '1',
          level: '1',
          banner: 'https://images.ctfassets.net/hrltx12pl8hq/7oQKmoi04ul0JsCUxkuHih/3fbf330101cffcce262c7ab54844009d/05-nature-backgrounds_1491895829.jpg?fit=fill&w=480&h=270',
          name: 'Your first step',
          description: 'First contact with meditation',
        ),
        Course(
          id: '2',
          level: '1',
          name: 'Basic program',
          description: 'A basic course',
        ),
      ],
    ),
    LevelCourse(
      id: '3',
      title: 'Expert level',
      subTitle: 'Unaccompanied meditation',
      courses: [
        Course(
          id: '1',
          level: '1',
          banner: '',
          name: 'Habits',
          description: 'Feeling yourself from routine behavior',
        ),
      ],
    ),
    LevelCourse(
      id: '4',
      title: 'For special situation',
      subTitle: 'Support in difficult times',
      courses: [
        Course(
          id: '1',
          level: '1',
          banner: '',
          name: 'Pain relief',
          description: 'Establishing a connection with your body',
        ),
        Course(
          id: '1',
          level: '1',
          banner: '',
          name: 'Pain relief',
          description: 'Establishing a connection with your body',
        ),
      ],
    )
  ];
}
