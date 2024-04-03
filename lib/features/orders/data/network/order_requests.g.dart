// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderRequest _$AddOrderRequestFromJson(Map<String, dynamic> json) =>
    AddOrderRequest(
      product_id: json['product_id'] as String?,
      type: json['type'] as String?,
      count: json['count'] as String?,
      unit_id: json['unit_id'] as String?,
      unit_category_id: json['unit_category_id'] as String?,
      unit_sub_categories_id: json['unit_sub_categories_id'] as String?,
    );

Map<String, dynamic> _$AddOrderRequestToJson(AddOrderRequest instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'type': instance.type,
      'count': instance.count,
      'unit_id': instance.unit_id,
      'unit_category_id': instance.unit_category_id,
      'unit_sub_categories_id': instance.unit_sub_categories_id,
    };

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      order_id: json['order_id'] as String?,
      product_id: json['product_id'] as String?,
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'product_id': instance.product_id,
    };
