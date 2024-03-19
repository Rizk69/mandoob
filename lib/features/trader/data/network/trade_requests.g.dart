// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradeRequest _$TradeRequestFromJson(Map<String, dynamic> json) => TradeRequest(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$TradeRequestToJson(TradeRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'price': instance.price,
    };
