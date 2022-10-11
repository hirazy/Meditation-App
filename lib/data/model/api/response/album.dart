import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';

@freezed
class Album with _$Album {
  factory Album({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'isPurchased') required bool isPurchased,
  }) = _Album;
}
