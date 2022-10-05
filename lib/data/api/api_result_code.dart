class ApiResultCode {
  static SuccessCode successCode = const SuccessCode();
}

class SuccessCode {
  const SuccessCode();

  final String suc0000 = 'suc0000';
  final int suc200 = 200;
  final int suc201 = 201;
  final int suc204 = 204;
}

class CommonCode{
  const CommonCode();

}

class ErrorCode{


}

class MessageCode{
  /// Sign up message
  final String s0100 = 'Sign up failed';
}