import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/repository/debt_repository.dart';
import 'package:mandoob/features/notfication/domain/model/notification_model.dart';
import 'package:mandoob/features/notfication/domain/repository/notification_repository.dart';

class GetNotificationUseCase
    implements BaseUseCase<void, NotificationModel> {
  final NotificationRepository _notificationRepository;

  GetNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<Failure, NotificationModel>> execute(void input) async {
    return await _notificationRepository.getNotification();
  }
}
