extension StringExtension on String {
  String get displayPercent {
    return '$this%';
  }

  int toInt() {
    return int.parse(this);
  }
}
