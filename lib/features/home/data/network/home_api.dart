import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/home/data/responses/home_response.dart';
import 'package:retrofit/http.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class HomeServiceClient {
  factory HomeServiceClient(Dio dio, {String baseUrl}) = _HomeServiceClient;

  @GET("api/edit_show_price/{priceId}")
  Future<HomeResponse> editShowPrice(@Path() int priceId);

  @GET("api/home")
  Future<HomeResponse> getHome();
}
