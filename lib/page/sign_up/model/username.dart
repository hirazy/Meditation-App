import 'package:formz/formz.dart';

enum UserNameValidatorError {
  pure,
  empty,
  invalid,
}

extension UserNameValidationErrorExtension on UserNameValidatorError {
  String? get description {
    switch (this) {
      case UserNameValidatorError.pure:
        return null;
      case UserNameValidatorError.empty:
        return '';
      case UserNameValidatorError.invalid:
        return 'Error';
    }
  }
}

class UserName extends FormzInput<String?, UserNameValidatorError> {
  UserName.pure() : super.pure('');

  UserName.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameValidatorError? validator(String? value) {
    if (value == null) {
      return UserNameValidatorError.pure;
    } else if (value.isEmpty) {
      return UserNameValidatorError.empty;
    }
    return null;
  }
}
