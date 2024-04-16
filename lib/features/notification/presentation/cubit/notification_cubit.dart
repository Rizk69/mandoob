import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/usecase/get_notification_usecases.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._getNotificationUseCase)
      : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);

  final GetNotificationUseCase _getNotificationUseCase;

  NotificationModel? model;

  Future<void> getNotifications() async {
    emit(GetNotificationLoadingState());
    final result = await _getNotificationUseCase.execute('');
    result.fold((failure) => emit(GetNotificationErrorState(failure.message)),
        (success) {
      model = success;
      emit(GetNotificationSuccessState());
    });
  }
}
