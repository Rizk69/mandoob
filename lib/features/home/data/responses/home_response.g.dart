// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      color: json['color'] as String?,
      balance: json['balance'] == null
          ? null
          : BalanceDataResponse.fromJson(
              json['balance'] as Map<String, dynamic>),
      deliveryLine: (json['delivary_Line'] as List<dynamic>?)
          ?.map((e) =>
              DeliveryLineDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..countDataResponse = json['count'] == null
        ? null
        : CountDataResponse.fromJson(json['count'] as Map<String, dynamic>);

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'color': instance.color,
      'balance': instance.balance,
      'count': instance.countDataResponse,
      'delivary_Line': instance.deliveryLine,
    };

BalanceDataResponse _$BalanceDataResponseFromJson(Map<String, dynamic> json) =>
    BalanceDataResponse(
      totalDoler: json['total_Doler'] as String?,
      totalLera: json['total_Lera'] as String?,
    );

Map<String, dynamic> _$BalanceDataResponseToJson(
        BalanceDataResponse instance) =>
    <String, dynamic>{
      'total_Doler': instance.totalDoler,
      'total_Lera': instance.totalLera,
    };

CountDataResponse _$CountDataResponseFromJson(Map<String, dynamic> json) =>
    CountDataResponse(
      active: json['active_1'] as num?,
      notActive: json['active_0'] as num?,
    );

Map<String, dynamic> _$CountDataResponseToJson(CountDataResponse instance) =>
    <String, dynamic>{
      'active_1': instance.active,
      'active_0': instance.notActive,
    };

DeliveryLineDataResponse _$DeliveryLineDataResponseFromJson(
        Map<String, dynamic> json) =>
    DeliveryLineDataResponse(
      id: json['id'] as num?,
      customerName: json['customer_name'] as String?,
      address: json['address'] as String?,
      date: json['date'] as String?,
      active: json['active'] as num?,
      number: json['number'] as num?,
    );

Map<String, dynamic> _$DeliveryLineDataResponseToJson(
        DeliveryLineDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_name': instance.customerName,
      'address': instance.address,
      'date': instance.date,
      'active': instance.active,
      'number': instance.number,
    };
