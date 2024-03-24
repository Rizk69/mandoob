// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLineRequest _$AddLineRequestFromJson(Map<String, dynamic> json) =>
    AddLineRequest(
      json['customer_id'] as String,
      json['date'] as String,
    );

Map<String, dynamic> _$AddLineRequestToJson(AddLineRequest instance) =>
    <String, dynamic>{
      'customer_id': instance.customer_id,
      'date': instance.date,
    };
