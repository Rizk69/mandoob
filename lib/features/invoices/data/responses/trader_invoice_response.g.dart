// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trader_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraderInvoiceResponse _$TraderInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    TraderInvoiceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              TraderInvoiceDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TraderInvoiceResponseToJson(
        TraderInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

TraderInvoiceDataResponse _$TraderInvoiceDataResponseFromJson(
        Map<String, dynamic> json) =>
    TraderInvoiceDataResponse(
      id: json['id'] as int?,
      invoiceNo: json['invoiceNo'] as String?,
      priceDoler: json['price_Doler'] as int?,
      priceLera: json['price_Lera'] as int?,
      customerName: json['customerName'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$TraderInvoiceDataResponseToJson(
        TraderInvoiceDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNo': instance.invoiceNo,
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
      'customerName': instance.customerName,
      'date': instance.date,
    };
