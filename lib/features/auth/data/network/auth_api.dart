import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/data/responses/login/login_response.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';
import 'package:retrofit/http.dart';


part 'auth_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;

  @POST("api/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET("api/profile")
  Future<UserResponse> getProfile();

  @POST("api/edit_color_profile")
  Future<void> editColorProfile(@Body() ColorProfile colorProfile);
}
