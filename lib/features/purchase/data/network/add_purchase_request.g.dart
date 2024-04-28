// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_purchase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPurchaseRequest _$AddPurchaseRequestFromJson(Map<String, dynamic> json) =>
    AddPurchaseRequest(
      productName: json['product_name'] as String?,
      price: json['price'] as String?,
      count: json['count'] as String?,
      currencyId: json['currency_id'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$AddPurchaseRequestToJson(AddPurchaseRequest instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'count': instance.count,
      'unit': instance.unit,
      'price': instance.price,
      'currency_id': instance.currencyId,
    };
