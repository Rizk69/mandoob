// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talabat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TalabatResponse _$TalabatResponseFromJson(Map<String, dynamic> json) =>
    TalabatResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      balance: json['balance'] == null
          ? null
          : BalanceTalabatResponse.fromJson(
              json['balance'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
          ?.map(
              (e) => OrdersTalabatResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TalabatResponseToJson(TalabatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'balance': instance.balance,
      'orders': instance.orders,
    };

OrdersTalabatResponse _$OrdersTalabatResponseFromJson(
        Map<String, dynamic> json) =>
    OrdersTalabatResponse(
      id: json['id'] as int?,
      orderNo: json['orderNo'] as String?,
      date: json['date'] as String?,
      priceDoler: json['priceDoler'] as int?,
      priceLera: json['priceLera'] as int?,
    )
      ..status_ar = json['status_ar'] as String?
      ..status_en = json['status_en'] as String?;

Map<String, dynamic> _$OrdersTalabatResponseToJson(
        OrdersTalabatResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNo': instance.orderNo,
      'status_ar': instance.status_ar,
      'status_en': instance.status_en,
      'date': instance.date,
      'priceDoler': instance.priceDoler,
      'priceLera': instance.priceLera,
    };

BalanceTalabatResponse _$BalanceTalabatResponseFromJson(
        Map<String, dynamic> json) =>
    BalanceTalabatResponse(
      totalDoler: json['totalDoler'] as int?,
      totalLera: json['totalLera'] as int?,
    );

Map<String, dynamic> _$BalanceTalabatResponseToJson(
        BalanceTalabatResponse instance) =>
    <String, dynamic>{
      'totalDoler': instance.totalDoler,
      'totalLera': instance.totalLera,
    };
