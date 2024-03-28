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
          : BalanceTalabatResponse.fromJson(json['balance']),
      orders: (json['orders'] as List<dynamic>?)
          ?.map(OrdersTalabatResponse.fromJson)
          .toList(),
    );

Map<String, dynamic> _$TalabatResponseToJson(TalabatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'balance': instance.balance,
      'orders': instance.orders,
    };
