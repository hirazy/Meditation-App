import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

enum UserNameValidatorError {
  pure,
  empty,
  invalid,
}

extension UserNameValidationErrorExtension on UserNameValidatorError {
  String? description({required BuildContext context}) {
    switch (this) {
      case UserNameValidatorError.pure:
        return null;
      case UserNameValidatorError.empty:
        return '';
      case UserNameValidatorError.invalid:
        return AppLocalizations.of(context)!.errorValidUsername;
    }
  }
}

class UserName extends FormzInput<String?, UserNameValidatorError> {
  const UserName.pure() : super.pure('');

  const UserName.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameValidatorError? validator(String? value) {
    if (value == null) {
      return UserNameValidatorError.pure;
    } else if (value.isEmpty) {
      return UserNameValidatorError.empty;
    } else if (value.length < 8) {
      return UserNameValidatorError.invalid;
    }
    return null;
  }
}
