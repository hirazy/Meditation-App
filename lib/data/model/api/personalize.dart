import 'package:freezed_annotation/freezed_annotation.dart';

part 'personalize.freezed.dart';
part 'personalize.g.dart';

@freezed
class Personalize with _$Personalize {
  factory Personalize({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
  }) = _Personalize;

  factory Personalize.fromJson(Map<String, dynamic> json) =>
      _$PersonalizeFromJson(json);
}
