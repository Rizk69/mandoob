import 'package:mandoob/features/notification/data/network/notification_api.dart';
import 'package:mandoob/features/notification/data/responses/notification_response.dart';

abstract class RemoteNotificationsDataSource {
  Future<NotificationResponse> getNotification();
}

class RemoteNotificationsDataSourceImpl extends RemoteNotificationsDataSource {
  final NotificationServiceClient _appServiceClient;

  RemoteNotificationsDataSourceImpl(this._appServiceClient);

  @override
  Future<NotificationResponse> getNotification() {
    return _appServiceClient.getNotification();
  }
}
