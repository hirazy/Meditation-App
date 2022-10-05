
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError implements Exception {
  factory AppError({
    String? message,
    String? messageCode,
    String? resultCode,
  }) = _AppError;

  const AppError._();
}
