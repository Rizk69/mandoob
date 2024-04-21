import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/debts/data/network/pay_dept_trader_request.dart';
import 'package:mandoob/features/debts/data/responses/debt_delegate_response.dart';
import 'package:mandoob/features/debts/data/responses/debt_trader_response.dart';
import 'package:mandoob/features/debts/data/responses/pay_debt_trader_response.dart';
import 'package:retrofit/http.dart';

import '../responses/debt_invoice_trader_response.dart';

part 'debt_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class DebtServiceClient {
  factory DebtServiceClient(Dio dio, {String baseUrl}) = _DebtServiceClient;

  @GET("api/get_debt_trader")
  Future<DebtTraderResponse> getDebtTrader();


  @GET("api/get_debt_delivery")
  Future<DebtDelegateResponse> getDebtDelegate();

  @GET("api/get_debt_invoice_trader/{invoiceId}")
  Future<DebtInvoiceTraderResponse> getDebtInvoiceTrade(@Path() int invoiceId);

  @POST("api/pay_debt_trader")
  Future<PayDebtTraderResponse> payDebtTrader(@Body() PayDeptTraderRequest payDeptTraderRequest);


}
