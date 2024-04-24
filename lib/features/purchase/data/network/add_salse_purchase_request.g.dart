// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_salse_purchase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSalsePurchaseRequest _$AddSalsePurchaseRequestFromJson(
        Map<String, dynamic> json) =>
    AddSalsePurchaseRequest(
      customerId: json['customer_id'] as String?,
      price: json['price'] as String?,
      count: json['count'] as String?,
      currencyId: json['currency_id'] as String?,
      purcheseId: json['purchese_id'] as String?,
    );

Map<String, dynamic> _$AddSalsePurchaseRequestToJson(
        AddSalsePurchaseRequest instance) =>
    <String, dynamic>{
      'purchese_id': instance.purcheseId,
      'count': instance.count,
      'customer_id': instance.customerId,
      'price': instance.price,
      'currency_id': instance.currencyId,
    };
