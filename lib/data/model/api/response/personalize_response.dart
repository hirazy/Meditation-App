import 'package:freezed_annotation/freezed_annotation.dart';

import '../personalize.dart';

part 'personalize_response.freezed.dart';
part 'personalize_response.g.dart';

@freezed
class PersonalizeResponse with _$PersonalizeResponse {
  factory PersonalizeResponse({
    @JsonKey(name: 'code') required String code,
    String? errmsg,
    List<Personalize>? personalizes,
  }) = _PersonalizeResponse;

  factory PersonalizeResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalizeResponseFromJson(json);
}
