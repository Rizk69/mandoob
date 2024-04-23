// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trades_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradesResponse _$TradesResponseFromJson(Map<String, dynamic> json) =>
    TradesResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      trades: (json['data'] as List<dynamic>?)
          ?.map((e) => TradesDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TradesResponseToJson(TradesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.trades,
    };

TradesDataResponse _$TradesDataResponseFromJson(Map<String, dynamic> json) =>
    TradesDataResponse(
      id: json['id'] as int?,
      img: json['img'] as String?,
      customer_name: json['customer_name'] as String?,
      phone: json['phone'] as String?,
      selectCustomer: json['select_custoomer'] as bool?,
      address: json['address'] as String?,
      priceEn: json['price_en'] as String?,
      priceAr: json['price_ar'] as String?,
    );

Map<String, dynamic> _$TradesDataResponseToJson(TradesDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'customer_name': instance.customer_name,
      'phone': instance.phone,
      'price_ar': instance.priceAr,
      'price_en': instance.priceEn,
      'address': instance.address,
      'select_custoomer': instance.selectCustomer,
    };
