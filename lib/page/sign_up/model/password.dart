import 'package:formz/formz.dart';

enum PasswordValidatorError {
  pure,
  empty,
  notEnoughLength,

  invalid,
}

extension PasswordValidationErrorExtension on PasswordValidatorError {
  String? get description {
    switch (this) {
      case PasswordValidatorError.pure:
        return null;
      case PasswordValidatorError.empty:
        return '';
      case PasswordValidatorError.notEnoughLength:
        return '';
      case PasswordValidatorError.invalid:
        return 'Error';
    }
  }
}

class Password extends FormzInput<String?, PasswordValidatorError> {
  Password.pure() : super.pure('');

  Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidatorError? validator(String? value) {
    if (value == null) {
      return PasswordValidatorError.pure;
    } else if (value.isEmpty) {
      return PasswordValidatorError.empty;
    }
    return null;
  }
}
