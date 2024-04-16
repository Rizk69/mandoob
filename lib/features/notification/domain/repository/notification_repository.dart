import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';


abstract class NotificationRepository {

  Future<Either<Failure, NotificationModel>> getNotification();

}
