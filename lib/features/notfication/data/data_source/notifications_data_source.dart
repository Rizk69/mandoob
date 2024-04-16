import 'package:mandoob/features/debts/data/network/debt_api.dart';
import 'package:mandoob/features/debts/data/responses/debt_trader_response.dart';
import 'package:mandoob/features/notfication/data/network/notification_api.dart';
import 'package:mandoob/features/notfication/data/responses/notification_response.dart';

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
