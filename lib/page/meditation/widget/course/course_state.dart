import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_state.freezed.dart';

@freezed
class CourseState with _$CourseState {
  factory CourseState({
    @Default(0) int index,
  }) = _CourseState;

  factory CourseState.initial() => CourseState();
}
