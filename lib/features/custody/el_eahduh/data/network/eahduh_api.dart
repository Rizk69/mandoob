import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';
import 'package:retrofit/http.dart';

import '../responses/eahduh_response.dart';

part 'eahduh_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class EahduhServiceClient {
  factory EahduhServiceClient(Dio dio, {String baseUrl}) = _EahduhServiceClient;

  @GET("api/order")
  Future<EahduhResponse> getEahduhOrder();
  @GET("api/add_favorite_products/{productId}")
  Future<void> addEahduhOrder(@Path() int productId);
  @GET("api/delete_favorite_products/{productId}")
  Future<void> deleteEahduhOrder(@Path() int productId);

}
