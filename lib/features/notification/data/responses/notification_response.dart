import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "notification")
  List<NotificationDetailResponse>? notification;

  NotificationResponse({
    this.status,
    this.message,
    this.notification,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}

@JsonSerializable()
class NotificationDetailResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "title_ar")
  String? titleAr;
  @JsonKey(name: "title_en")
  String? titleEn;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "description_ar")
  String? descriptionAr;
  @JsonKey(name: "description_en")
  String? descriptionEn;
  @JsonKey(name: "read")
  int? read;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "date")
  String? date;

  NotificationDetailResponse({
    this.id,
    this.title,
    this.titleAr,
    this.titleEn,
    this.description,
    this.descriptionAr,
    this.descriptionEn,
    this.read,
    this.type,
    this.date,
  });

  factory NotificationDetailResponse.fromJson(Map<String, dynamic> json) => _$NotificationDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationDetailResponseToJson(this);
}
