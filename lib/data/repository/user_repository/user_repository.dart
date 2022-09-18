import '../../model/api/api_result.dart';
import '../../model/api/request/user_register_request.dart';
import '../../model/api/response/user_register_response.dart';
import '../repository.dart';

class UserRepository extends Repository {
  UserRepository(read) : super(read);

  Future<ApiResult<UserRegisterResponse>> signUp(
    UserRegisterRequest userRegisterRequest,
  ) async {
    final response = await apiClient().signUp(userRegisterRequest);
    return ApiResult(response);
  }
}
