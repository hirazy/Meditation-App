import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/api/request/user_register_request.dart';
import '../model/api/response/user_register_response.dart';
import 'api_paths.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;

  @POST(ApiPaths.userTerm)
  Future<UserRegisterResponse> signUp(@Body() UserRegisterRequest userRegisterRequest);
}
