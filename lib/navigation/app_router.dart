import 'package:flutter/material.dart';

import '../page/home_tab/home_tab_page.dart';
import '../page/sign_up/personalize/personalize_page.dart';
import '../page/sign_up/setting/sign_up_setting_page.dart';
import '../page/sign_up/top/sign_up_top_page.dart';
import '../page/splash/splash_page.dart';
import '../page/welcome/welcome_page.dart';
import 'app_route.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashPage(),
        );
      case AppRoute.welcome:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const WelcomePage(),
        );
      case AppRoute.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignUpTopPage(),
        );
      case AppRoute.personalize:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const PersonalizePage(),
        );
      case AppRoute.signUpSetting:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SignUpSettingPage(),
        );
      case AppRoute.homeTab:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeTabPage(),
        );
    }
    return null;
  }
}
