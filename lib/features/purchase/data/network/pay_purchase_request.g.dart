// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_purchase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayPurchaseRequest _$PayPurchaseRequestFromJson(Map<String, dynamic> json) =>
    PayPurchaseRequest(
      sellPurchaseId: json['sell_purchase_id'] as String?,
      dueDate: json['due_date'] as String?,
      payDoler: json['pay_Doler'] as String?,
      payLera: json['pay_Lera'] as String?,
    );

Map<String, dynamic> _$PayPurchaseRequestToJson(PayPurchaseRequest instance) =>
    <String, dynamic>{
      'sell_purchase_id': instance.sellPurchaseId,
      'pay_Doler': instance.payDoler,
      'pay_Lera': instance.payLera,
      'due_date': instance.dueDate,
    };
