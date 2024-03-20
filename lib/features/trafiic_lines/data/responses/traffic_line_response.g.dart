// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traffic_line_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrafficResponse _$TrafficResponseFromJson(Map<String, dynamic> json) =>
    TrafficResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrafficDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..countDataModel = json['count'] == null
        ? null
        : CountDataTrafficResponse.fromJson(
            json['count'] as Map<String, dynamic>);

Map<String, dynamic> _$TrafficResponseToJson(TrafficResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'count': instance.countDataModel?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

TrafficDataResponse _$TrafficDataResponseFromJson(Map<String, dynamic> json) =>
    TrafficDataResponse(
      id: json['id'] as int?,
      customerName: json['customer_name'] as String?,
      address: json['address'] as String?,
      date: json['date'] as String?,
      active: json['active'] as int?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$TrafficDataResponseToJson(
        TrafficDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_name': instance.customerName,
      'address': instance.address,
      'date': instance.date,
      'active': instance.active,
      'number': instance.number,
    };

CountDataTrafficResponse _$CountDataTrafficResponseFromJson(
        Map<String, dynamic> json) =>
    CountDataTrafficResponse(
      active: json['active_1'] as num?,
      notActive: json['active_0'] as num?,
    );

Map<String, dynamic> _$CountDataTrafficResponseToJson(
        CountDataTrafficResponse instance) =>
    <String, dynamic>{
      'active_1': instance.active,
      'active_0': instance.notActive,
    };
