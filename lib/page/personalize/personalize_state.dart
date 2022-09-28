import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/api/personalize.dart';

part 'personalize_state.freezed.dart';

@freezed
class PersonalizeState with _$PersonalizeState {
  factory PersonalizeState({
    @Default([]) List<Personalize> personalizes,
    Exception? error,
  }) = _PersonalizeState;

  factory PersonalizeState.initial() => PersonalizeState(personalizes: []);
}
