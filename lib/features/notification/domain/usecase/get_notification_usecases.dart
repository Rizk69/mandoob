import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/repository/notification_repository.dart';


class GetNotificationUseCase
    implements BaseUseCase<void, NotificationModel> {
  final NotificationRepository _notificationRepository;

  GetNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<Failure, NotificationModel>> execute(void input) async {
    return await _notificationRepository.getNotification();
  }
}
