import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppNavigatorAction { keep, replace, removeAll }

class AppNavigator {
  AppNavigator({
    required this.read,
  });

  final Reader read;

  final navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    Object? arguments,
    bool shouldClearStack = true,
  }) async {
    final currentState = navigatorKey.currentState;

    if (currentState == null) {
      return false;
    }

    if (shouldClearStack) {
      await currentState.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }

    return currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void goBack(arguments) {
    final currentState = navigatorKey.currentState;

    if (currentState == null) {
      return;
    }

    currentState.pop(arguments);
  }

  bool _isCurrent(String routeName, NavigatorState currentState) {
    var isCurrent = false;
    currentState.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }

      return true;
    });
    return isCurrent;
  }

  bool isCurrentWithRouteName({required String routeName}) {
    final currentState = navigatorKey.currentState;

    if (currentState == null) {
      return false;
    }

    return _isCurrent(routeName, currentState);
  }
}
