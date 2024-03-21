import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/trafiic_lines/data/network/search_requests.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';
import 'package:retrofit/http.dart';

part 'traffic_line_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class TrafficLineServiceClient {
  factory TrafficLineServiceClient(Dio dio, {String baseUrl}) = _TrafficLineServiceClient;

  @GET("api/delivary_line")
  Future<TrafficResponse> getDelivaryLine();
  @GET("api/delivary_line/{id}")
  Future<void> deleteDelivaryLine(@Path() int id);

  @POST("api/search_delivary_line")
  Future<TrafficResponse> searchDelivaryLine(@Body() SearchLineRequest searchLineRequest);
}
