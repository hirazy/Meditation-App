import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    required String version,
    @Default(false) bool isAuthenticated,
  }) = _SplashState;

  const SplashState._();

  factory SplashState.initial() => SplashState(
        version: '',
      );
}
