part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}


class GetNotificationLoadingState extends NotificationState {}
class GetNotificationSuccessState extends NotificationState {}
class GetNotificationErrorState extends NotificationState {
  final String error ;

  GetNotificationErrorState(this.error);
}
