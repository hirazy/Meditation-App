import 'package:freezed_annotation/freezed_annotation.dart';

import 'course.dart';

part 'level_course.freezed.dart';
part 'level_course.g.dart';

@freezed
class LevelCourse with _$LevelCourse {
  factory LevelCourse({
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'errmsg') String? errmsg,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'subTitle') String? subTitle,
    @JsonKey(name: 'courses') List<Course>? courses,
  }) = _LevelCourse;

  factory LevelCourse.fromJson(Map<String, dynamic> json) =>
      _$LevelCourseFromJson(json);
}
