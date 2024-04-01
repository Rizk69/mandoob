import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:retrofit/http.dart';

import '../responses/company_products_response.dart';
import '../responses/talabat_response.dart';

part 'talabat_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class TalabatServiceClient {
  factory TalabatServiceClient(Dio dio, {String baseUrl}) = _TalabatServiceClient;

  @GET("api/get_Present_orders")
  Future<TalabatResponse> getPresentOrders();

  @GET("api/get_old_orders")
  Future<TalabatResponse> getOldOrders();

  @GET("api/get_products_company")
  Future<CompanyProductsResponse> getCompanyProducts();

  @POST("api/add_order")
  Future<CompanyProductsResponse> addTalabat();

}
