// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_invoice_trader_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtInvoiceTraderResponse _$DebtInvoiceTraderResponseFromJson(
        Map<String, dynamic> json) =>
    DebtInvoiceTraderResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DebtInvoiceTraderDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DebtInvoiceTraderResponseToJson(
        DebtInvoiceTraderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DebtInvoiceTraderDataResponse _$DebtInvoiceTraderDataResponseFromJson(
        Map<String, dynamic> json) =>
    DebtInvoiceTraderDataResponse(
      id: json['id'] as int?,
      traderName: json['trader_name'] as String?,
      traderPhone: json['trader_phone'] as String?,
      date: json['date'] as String?,
      invoiceNo: json['invoice_no'] as String?,
      debtPriceDoler: json['debt_price_Doler'] as String?,
      debtPriceLera: json['debt_price_Lera'] as String?,
      payPriceDoler: json['pay_price_Doler'] as String?,
      payPriceLera: json['pay_price_Lera'] as String?,
      restPriceDoler: json['rest_price_Doler'] as String?,
      restPriceLera: json['rest_price_Lera'] as String?,
    );

Map<String, dynamic> _$DebtInvoiceTraderDataResponseToJson(
        DebtInvoiceTraderDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trader_name': instance.traderName,
      'trader_phone': instance.traderPhone,
      'date': instance.date,
      'invoice_no': instance.invoiceNo,
      'debt_price_Doler': instance.debtPriceDoler,
      'debt_price_Lera': instance.debtPriceLera,
      'pay_price_Doler': instance.payPriceDoler,
      'pay_price_Lera': instance.payPriceLera,
      'rest_price_Doler': instance.restPriceDoler,
      'rest_price_Lera': instance.restPriceLera,
    };
