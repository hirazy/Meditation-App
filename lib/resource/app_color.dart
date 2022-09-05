import 'dart:ui';

class AppColor {
  const AppColor({
    required this.lightBlue,
  });

  final Color lightBlue;


  /// Light Theme
  static const light = AppColor(
    lightBlue: Color.fromRGBO(152, 196, 236, 100),
  );

  /// Dark Theme

}
