import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_all_list_arguments.freezed.dart';

@freezed
class ViewAllListArguments with _$ViewAllListArguments {
  factory ViewAllListArguments({
    required String id,
    required String title,
  }) = _ViewAllListArguments;

  const ViewAllListArguments._();
}
