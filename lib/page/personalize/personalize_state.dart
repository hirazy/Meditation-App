import 'package:freezed_annotation/freezed_annotation.dart';

import 'model/personalize_item.dart';

part 'personalize_state.freezed.dart';

@freezed
class PersonalizeState with _$PersonalizeState {
  factory PersonalizeState({
    @Default([]) List<PersonalizeItem> personalizes,
    Exception? error,
  }) = _PersonalizeState;

  factory PersonalizeState.initial() => PersonalizeState(personalizes: []);
}
