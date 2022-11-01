import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_course.freezed.dart';
part 'session_course.g.dart';

@freezed
class SessionCourse with _$SessionCourse {
  factory SessionCourse({
    @JsonKey(name: 'code') required String code,
  }) = _SessionCourse;

  factory SessionCourse.fromJson(Map<String, dynamic> json) =>
      _$SessionCourseFromJson(json);
}
