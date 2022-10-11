import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

enum Expression {
  relax,
  sleep,
  stress,
  breath,
  anxiety,
}

extension ExpressionValue on Expression {
  String getMessage(BuildContext context) {
    switch (this) {
      case Expression.relax:
        return 'Relax';
      case Expression.sleep:
        return 'Sleep';
      case Expression.stress:
        return 'Stress';
      case Expression.breath:
        return 'Breath';
      case Expression.anxiety:
        return 'Anxiety';
    }
  }

  String getPath(){
    switch (this) {
      case Expression.relax:
        return Assets.images.icExpressionRelaxWhite.path;
      case Expression.sleep:
        return Assets.images.icExpressionSleepWhite.path;
      case Expression.stress:
        return Assets.images.icExpressionStressWhite.path;
      case Expression.breath:
        return Assets.images.icExpressionBreathWhite.path;
      case Expression.anxiety:
        return Assets.images.icExpressionAnxietyWhite.path;
    }
  }
}
