// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicePurchaseResponses _$InvoicePurchaseResponsesFromJson(
        Map<String, dynamic> json) =>
    InvoicePurchaseResponses(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      invoice: json['invoice'] == null
          ? null
          : InvoiceResponses.fromJson(json['invoice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoicePurchaseResponsesToJson(
        InvoicePurchaseResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'invoice': instance.invoice,
    };

InvoiceResponses _$InvoiceResponsesFromJson(Map<String, dynamic> json) =>
    InvoiceResponses(
      id: json['id'] as int?,
      productName: json['product_name'] as String?,
      count: json['count'] as int?,
      priceDoler: json['price_Doler'] as String?,
      priceLera: json['price_Lera'] as String?,
      payPriceDoler: json['pay_price_Doler'] as String?,
      payPriceLera: json['pay_price_Lera'] as String?,
      restPriceDoler: json['rest_price_Doler'] as String?,
      restPriceLera: json['rest_price_Lera'] as String?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerphone'] as String?,
      payAr: json['pay_ar'] as String?,
      payEn: json['pay_en'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$InvoiceResponsesToJson(InvoiceResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'count': instance.count,
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
      'pay_price_Doler': instance.payPriceDoler,
      'pay_price_Lera': instance.payPriceLera,
      'rest_price_Doler': instance.restPriceDoler,
      'rest_price_Lera': instance.restPriceLera,
      'customerName': instance.customerName,
      'customerphone': instance.customerPhone,
      'pay_ar': instance.payAr,
      'pay_en': instance.payEn,
      'date': instance.date,
    };
