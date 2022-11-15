extension DoubleExtension on double {
  double toPercent() {
    return this / 100;
  }

  String toPercentString() {
    return toPercent().toString();
  }
}
