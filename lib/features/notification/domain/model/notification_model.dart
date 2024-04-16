class NotificationModel {
  bool? status;
  String? message;
  List<NotificationDataModel>? notification;

  NotificationModel({
    this.status,
    this.message,
    this.notification,
  });

}



class NotificationDataModel {
  int id;
  String title;
  String titleAr;
  String titleEn;
  String description;
  String descriptionAr;
  String descriptionEn;
  int read;
  String type;
  String date;

  NotificationDataModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.titleEn,
    required this.description,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.read,
    required this.type,
    required this.date,
  });
}
