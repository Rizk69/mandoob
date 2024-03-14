import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/data/responses/login/login_response.dart';
import 'package:retrofit/http.dart';

import '../responses/profile/user_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("api/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET("api/profile")
  Future<UserResponse> getProfile();
  @GET("api/delivary_line")
  Future<UserResponse> getDelivaryLine();
  @POST("api/edit_color_profile")
  Future<void> editColorProfile(@Body() ColorProfile colorProfile);
}
