// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponses _$MessageResponsesFromJson(Map<String, dynamic> json) =>
    MessageResponses(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MessageResponsesToJson(MessageResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
