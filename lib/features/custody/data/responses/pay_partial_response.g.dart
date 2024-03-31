// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_partial_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayPartialResponse _$PayPartialResponseFromJson(Map<String, dynamic> json) =>
    PayPartialResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PayPartialResponseToJson(PayPartialResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
