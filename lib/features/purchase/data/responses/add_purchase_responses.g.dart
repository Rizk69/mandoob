// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_purchase_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPurchaseResponses _$AddPurchaseResponsesFromJson(
        Map<String, dynamic> json) =>
    AddPurchaseResponses(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      sellPurchaseId: json['sell_purchase_id'] as int?,
    );

Map<String, dynamic> _$AddPurchaseResponsesToJson(
        AddPurchaseResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'sell_purchase_id': instance.sellPurchaseId,
    };
