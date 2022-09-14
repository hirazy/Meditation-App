import 'package:flutter/material.dart';

import '../page/sign_up/sign_up_page.dart';
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
          builder: (context) => const SignUpPage(),
        );
    }
    return null;
  }
}
