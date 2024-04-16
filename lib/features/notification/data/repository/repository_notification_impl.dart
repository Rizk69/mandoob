import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/notification/data/data_source/notifications_data_source.dart';
import 'package:mandoob/features/notification/data/mapper/notification_mapper.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/repository/notification_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final RemoteNotificationsDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  NotificationRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, NotificationModel>> getNotification() async {
    final response = await _remoteDataSource.getNotification();

    try {
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        print(response.message);
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message ?? LocaleKeys.ERROR.tr(),
        ));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
