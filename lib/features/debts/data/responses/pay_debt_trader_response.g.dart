// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_debt_trader_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayDebtTraderResponse _$PayDebtTraderResponseFromJson(
        Map<String, dynamic> json) =>
    PayDebtTraderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      invoiceId: json['invoice_id'] as int?,
    );

Map<String, dynamic> _$PayDebtTraderResponseToJson(
        PayDebtTraderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'invoice_id': instance.invoiceId,
    };
