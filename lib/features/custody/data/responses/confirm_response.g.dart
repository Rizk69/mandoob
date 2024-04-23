// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmResponse _$ConfirmResponseFromJson(Map<String, dynamic> json) =>
    ConfirmResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      invoiceId: json['invoice_id'] as num?,
      priceDoler: json['price_Doler'] as String?,
      priceLera: json['price_Lera'] as String?,
    );

Map<String, dynamic> _$ConfirmResponseToJson(ConfirmResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'invoice_id': instance.invoiceId,
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
    };
