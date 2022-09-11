import 'dart:ui';

class AppColor {
  const AppColor({
    required this.lightBlue,
  });

  static const bgLightBtn = Color.fromARGB(100, 110, 185, 248);

  final Color lightBlue;

  /// Light Theme
  static const light = AppColor(
    lightBlue: Color.fromARGB(100, 110, 185, 248),
  );

  /// Dark Theme

}
