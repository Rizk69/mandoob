// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderResponse _$AddOrderResponseFromJson(Map<String, dynamic> json) =>
    AddOrderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      order_id: json['order_id'] as int?,
    );

Map<String, dynamic> _$AddOrderResponseToJson(AddOrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'order_id': instance.order_id,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
