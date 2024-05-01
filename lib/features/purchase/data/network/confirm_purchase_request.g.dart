// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_purchase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmPurchaseRequest _$ConfirmPurchaseRequestFromJson(
        Map<String, dynamic> json) =>
    ConfirmPurchaseRequest(
      pay: json['pay'] as String?,
      sellPurchaseId: json['sell_purchase_id'] as String?,
    );

Map<String, dynamic> _$ConfirmPurchaseRequestToJson(
        ConfirmPurchaseRequest instance) =>
    <String, dynamic>{
      'sell_purchase_id': instance.sellPurchaseId,
      'pay': instance.pay,
    };
