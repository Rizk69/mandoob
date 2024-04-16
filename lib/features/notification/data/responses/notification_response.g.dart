// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      notification: (json['notification'] as List<dynamic>?)
          ?.map((e) =>
              NotificationDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'notification': instance.notification,
    };

NotificationDetailResponse _$NotificationDetailResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDetailResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      description: json['description'] as String?,
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      read: json['read'] as int?,
      type: json['type'] as int?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$NotificationDetailResponseToJson(
        NotificationDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'description': instance.description,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
      'read': instance.read,
      'type': instance.type,
      'date': instance.date,
    };
