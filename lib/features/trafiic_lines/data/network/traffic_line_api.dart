import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';
import 'package:retrofit/http.dart';

part 'traffic_line_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class TrafficLineServiceClient {
  factory TrafficLineServiceClient(Dio dio, {String baseUrl}) = _TrafficLineServiceClient;

  @GET("api/delivary_line")
  Future<TrafficResponse> getDelivaryLine();
}
