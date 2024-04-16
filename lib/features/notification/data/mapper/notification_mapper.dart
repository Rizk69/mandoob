import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/notification/data/responses/notification_response.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';

extension NotificationResponseMapper on NotificationResponse? {
  NotificationModel toDomain() {
    return NotificationModel(
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
      notification: this?.notification?.map((n) => n.toDomain()).toList() ?? [],
    );
  }
}

extension NotificationDetailResponseMapper on NotificationDetailResponse? {
  NotificationDataModel toDomain() {
    return NotificationDataModel(
      id: this?.id?.orZero() ?? Constants.zero,
      title: this?.title?.orEmpty() ?? Constants.empty,
      titleAr: this?.titleAr?.orEmpty() ?? Constants.empty,
      titleEn: this?.titleEn?.orEmpty() ?? Constants.empty,
      description: this?.description?.orEmpty() ?? Constants.empty,
      descriptionAr: this?.descriptionAr?.orEmpty() ?? Constants.empty,
      descriptionEn: this?.descriptionEn?.orEmpty() ?? Constants.empty,
      read: this?.read?.orZero() ?? Constants.zero,
      type: this?.type?.orEmpty() ?? Constants.empty,
      date: this?.date?.orEmpty() ?? Constants.empty,
    );
  }
}
