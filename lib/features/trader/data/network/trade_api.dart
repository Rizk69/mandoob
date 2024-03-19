import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/trader/data/network/trade_requests.dart';
import 'package:mandoob/features/trader/data/responses/trades_response.dart';
import 'package:retrofit/http.dart';


part 'trade_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class TradeServiceClient {
  factory TradeServiceClient(Dio dio, {String baseUrl}) = _TradeServiceClient;



  @GET("api/get_trader")
  Future<TradesResponse> getTrades();

  @POST("api/add_trader")
  Future<TradesResponse> addTrade(@Body() TradeRequest tradeRequest);


}
