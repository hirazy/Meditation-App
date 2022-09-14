import '../../model/api/request/user_register_request.dart';
import '../repository.dart';

class UserRepository extends Repository {
  UserRepository(read) : super(read);

  Future<void> signUp(UserRegisterRequest userRegisterRequest) async {
    final response = await apiClient().signUp(userRegisterRequest);
  }
}
