import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult(T data) = _Data<T>;

  const factory ApiResult.exception(Exception exception) = _Exception<T>;
}
