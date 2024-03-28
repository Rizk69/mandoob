import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/data/responses/cart_response.dart';
import 'package:mandoob/features/custody/data/responses/confirm_response.dart';
import 'package:mandoob/features/custody/data/responses/pay_partial_response.dart';
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

  @GET("api/get_cart")
  Future<CartResponse> getCart();



  @GET("api/addToCart/{productId}")
  Future<void> addProductToCart(@Path() int productId);

  @GET("api/delete_product_cart/{productId}")
  Future<void> deleteOneProductInCart(@Path() int productId);

  @GET("api/delete_cart")
  Future<void> deleteAllProductInCart();



  @GET("api/add_currency/{product_id}/{currency_id}/{count}")
  Future<void> addCurrencyAndCount(@Path() int product_id ,@Path()  int currency_id ,@Path()  num count);


  @POST("api/confirm_invoice")
  Future<ConfirmResponse> confirmInvoice(@Body() ConfirmRequest confirmRequest);


  @POST("api/pay_debt")
  Future<PayPartialResponse> payPartialDept(@Body() PayPartialDeptRequest partialDeptRequest);


}
