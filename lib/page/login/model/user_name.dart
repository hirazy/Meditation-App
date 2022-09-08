import 'package:formz/formz.dart';

enum UserNameValidator { pure, empty, invalid }

extension UserNameValidationErrorExtension on UserNameValidator {
  String? getErrorMessage() {
    switch (this) {
      case UserNameValidator.pure:
        return '';
      case UserNameValidator.empty:
        return '';
      case UserNameValidator.invalid:
        return null;
    }
  }
}

class UserName extends FormzInput<String?, UserNameValidator> {
  UserName.pure(super.value) : super.pure();

  @override
  UserNameValidator? validator(String? value) {
    throw UnimplementedError();
  }
}
