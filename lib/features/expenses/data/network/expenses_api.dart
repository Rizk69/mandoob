import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/expenses/data/responses/addExpenses_requests.dart';
import 'package:mandoob/features/expenses/data/responses/expenses_response.dart';
import 'package:mandoob/features/expenses/data/responses/reason_expenses_response.dart';
import 'package:retrofit/http.dart';

part 'expenses_api.g.dart';


@RestApi(baseUrl: Constants.baseUrl)
abstract class ExpensesServiceClient {
  factory ExpensesServiceClient(Dio dio, {String baseUrl}) = _ExpensesServiceClient;


  @GET("api/get_reason_expenses")
  Future<ReasonExpensesResponse> getExpensesReasons();


  @POST("api/add_expenses")
  Future<ReasonExpensesResponse> addExpensesReasons(@Body() AddExpensesRequests addExpensesRequests);

  @GET("api/get_expenses")
  Future<ExpensesResponse> getExpenses();


}
