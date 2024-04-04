import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/invoices/data/responses/supplier_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_invoice_response.dart';

import 'package:retrofit/http.dart';

part 'fawater_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class FawaterServiceClient {
  factory FawaterServiceClient(Dio dio, {String baseUrl}) =
      _FawaterServiceClient;

  @GET("api/get_trader_invoice")
  Future<TraderInvoiceResponse> getTraderInvoice();

  @GET("api/get_supplier_invoice")
  Future<SupplierInvoiceResponse> getSupplierInvoice();
}
