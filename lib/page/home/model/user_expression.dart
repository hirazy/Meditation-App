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
    path: Assets.images.icExpressionRelax.path,
    expression: 'Relax',
  ),
  UserExpression(
    path: Assets.images.icExpressionStress.path,
    expression: 'Stress',
  ),
];
