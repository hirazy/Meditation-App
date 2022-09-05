import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_state.freezed.dart';

@freezed
class WelcomeState with _$WelcomeState {
  factory WelcomeState({
    @Default(0) int indexPage,
  }) = _WelcomeState;

  const WelcomeState._();
}
