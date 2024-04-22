// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicesResponse _$InvoicesResponseFromJson(Map<String, dynamic> json) =>
    InvoicesResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      invoice: json['invoice'] == null
          ? null
          : InvoiceDataResponse.fromJson(
              json['invoice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoicesResponseToJson(InvoicesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'invoice': instance.invoice?.toJson(),
    };

InvoiceDataResponse _$InvoiceDataResponseFromJson(Map<String, dynamic> json) =>
    InvoiceDataResponse(
      id: json['id'] as int,
      invoiceNo: json['invoiceNo'] as String,
      priceDoler: json['price_Doler'] as num,
      priceLera: json['price_Lera'] as num,
      payPriceDoler: json['pay_price_Doler'] as num,
      payPriceLera: json['pay_price_Lera'] as num,
      restPriceDoler: json['rest_price_Doler'] as num,
      restPriceLera: json['rest_price_Lera'] as num,
      customerName: json['customerName'] as String,
      customerPhone: json['customerphone'] as String,
      paymentMethodAr: json['pay_ar'] as String,
      paymentMethodEn: json['pay_en'] as String,
      date: json['date'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceDataResponseToJson(
        InvoiceDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNo': instance.invoiceNo,
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
      'pay_price_Doler': instance.payPriceDoler,
      'pay_price_Lera': instance.payPriceLera,
      'rest_price_Doler': instance.restPriceDoler,
      'rest_price_Lera': instance.restPriceLera,
      'customerName': instance.customerName,
      'customerphone': instance.customerPhone,
      'pay_ar': instance.paymentMethodAr,
      'pay_en': instance.paymentMethodEn,
      'date': instance.date,
      'products': instance.products,
    };

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) =>
    ProductDataResponse(
      id: json['id'] as int,
      nameAr: json['name_ar'] as String,
      nameEn: json['name_en'] as String,
      count: json['count'] as int,
      unitAr: json['unit_ar'] as String,
      unitEn: json['unit_en'] as String,
      priceDoler: json['price_Doler'] as num,
      priceLera: json['price_Lera'] as num,
      date: json['date'] as String,
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'count': instance.count,
      'unit_ar': instance.unitAr,
      'unit_en': instance.unitEn,
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
      'date': instance.date,
    };
