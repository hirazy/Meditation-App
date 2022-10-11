import '../../../gen/assets.gen.dart';

class UserExpression {
  UserExpression({
    required this.path,
    required this.expression,
  });

  String path;
  String expression;
}

List<UserExpression> expressions = [
  UserExpression(
    path: Assets.images.icExpressionRelaxWhite.path,
    expression: 'Relax',
  ),
  UserExpression(
    path: Assets.images.icExpressionSleepWhite.path,
    expression: 'Sleep',
  ),
  UserExpression(
    path: Assets.images.icExpressionStressWhite.path,
    expression: 'Stress',
  ),
  UserExpression(
    path: Assets.images.icExpressionBreathWhite.path,
    expression: 'Breath',
  ),
  UserExpression(
    path: Assets.images.icExpressionAnxietyWhite.path,
    expression: 'Anxiety',
  ),
];
