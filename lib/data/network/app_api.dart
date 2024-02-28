import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/data/responses/login/login_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("api/delivary/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
