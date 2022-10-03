import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/app_error.dart';

part 'sign_up_setting_state.freezed.dart';

@freezed
class SignUpSettingState with _$SignUpSettingState {
  factory SignUpSettingState({
    AppError? appError,
  }) = _SignUpSettingState;

  factory SignUpSettingState.initial() => SignUpSettingState(
        appError: null,
      );
}
