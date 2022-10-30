import 'package:freezed_annotation/freezed_annotation.dart';

import 'session_course.dart';

part 'course.freezed.dart';

part 'course.g.dart';

@freezed
class Course with _$Course {
  factory Course({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'errrmsg') String? errmsg,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'level') String? level,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'banner') String? banner,
    @JsonKey(name: 'progress') int? progress,
    @JsonKey(name: 'sessions') List<SessionCourse>? sessions,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
