import 'package:dio/dio.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/notification/data/responses/notification_response.dart';
import 'package:retrofit/http.dart';

part 'notification_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class NotificationServiceClient {
  factory NotificationServiceClient(Dio dio, {String baseUrl}) = _NotificationServiceClient;

  @GET("api/all_notifications")
  Future<NotificationResponse> getNotification();


}
