import '../../../utils/extension/string_extension.dart';
import '../../app_error.dart';
import '../../model/api/api_result.dart';
import '../../model/api/personalize.dart';
import '../repository.dart';

class PersonalizeRepository extends Repository {
  PersonalizeRepository(super.read);

  Future<ApiResult<List<Personalize>>> getPersonalizes() async {
    final response = await apiClient().getPersonalizes();
    if (isOk(response.code.toInt())) {
      return ApiResult(response.personalizes ?? []);
    } else {
      return ApiResult.exception(AppError());
    }
  }
}
