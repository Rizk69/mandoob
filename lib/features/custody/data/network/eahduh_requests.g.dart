// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eahduh_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCurrencyAndCountRequest _$AddCurrencyAndCountRequestFromJson(
        Map<String, dynamic> json) =>
    AddCurrencyAndCountRequest(
      product_id: json['product_id'] as int?,
      currency_id: json['currency_id'] as int?,
      count: json['count'] as num?,
    );

Map<String, dynamic> _$AddCurrencyAndCountRequestToJson(
        AddCurrencyAndCountRequest instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'currency_id': instance.currency_id,
      'count': instance.count,
    };

ConfirmRequest _$ConfirmRequestFromJson(Map<String, dynamic> json) =>
    ConfirmRequest(
      pay: json['pay'] as int?,
    );

Map<String, dynamic> _$ConfirmRequestToJson(ConfirmRequest instance) =>
    <String, dynamic>{
      'pay': instance.pay,
    };
