import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/invoices/data/responses/supplier_details_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/supplier_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_details_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_invoice_response.dart';

import 'package:retrofit/http.dart';

part 'fawater_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class FawaterServiceClient {
  factory FawaterServiceClient(Dio dio, {String baseUrl}) =
      _FawaterServiceClient;

  @GET("api/get_trader_invoice")
  Future<TraderInvoiceResponse> getTraderInvoice();


  @GET("api/trader_invoice/{invoiceId}")
  Future<TraderDetailsInvoiceResponse> getTraderInvoiceDetails(@Path() int invoiceId);


  @GET("api/supplier_invoice")
  Future<SupplierDetailsInvoiceResponse> getSupplierInvoiceDetails();

  @GET("api/get_supplier_invoice")
  Future<SupplierInvoiceResponse> getSupplierInvoice();
}
