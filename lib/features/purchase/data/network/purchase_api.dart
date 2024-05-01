import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/confirm_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/pay_purchase_request.dart';
import 'package:mandoob/features/purchase/data/responses/add_purchase_responses.dart';
import 'package:mandoob/features/purchase/data/responses/invoice_responses.dart';
import 'package:mandoob/features/purchase/data/responses/message_responses.dart';
import 'package:mandoob/features/purchase/data/responses/purchase_responses.dart';
import 'package:retrofit/http.dart';

part 'purchase_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class PurchaseServiceClient {
  factory PurchaseServiceClient(Dio dio, {String baseUrl}) =
      _PurchaseServiceClient;

  @GET("api/get_purchase")
  Future<PurchaseResponses> getPurchase();
  @GET("api/get_invoice_purchase/{sell_purchase_id}")
  Future<InvoicePurchaseResponses> getInvoicePurchase(
      @Path("sell_purchase_id") int sellPurchaseId);
  @POST("api/add_purchase")
  Future<MessageResponses> addPurchase(
      @Body() AddPurchaseRequest addPurchaseRequest);
  @POST("api/add_selse_purchase")
  Future<AddPurchaseResponses> addSalsePurchase(
      @Body() AddSalsePurchaseRequest addSalsePurchaseRequest);
  @POST("api/confirm_purchase")
  Future<AddPurchaseResponses> confirmPurchase(
      @Body() ConfirmPurchaseRequest confirmPurchaseRequest);
  @POST("api/pay_purchase")
  Future<MessageResponses> payPurchase(
      @Body() PayPurchaseRequest payPurchaseRequest);
}
