// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trader_details_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraderDetailsInvoiceResponse _$TraderDetailsInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    TraderDetailsInvoiceResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : InvoiceDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TraderDetailsInvoiceResponseToJson(
        TraderDetailsInvoiceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'products': instance.products,
    };

InvoiceDataResponse _$InvoiceDataResponseFromJson(Map<String, dynamic> json) =>
    InvoiceDataResponse(
      id: json['id'] as int?,
      invoiceNo: json['invoiceNo'] as String?,
      priceDoler: json['price_Doler'] as int?,
      priceLera: json['price_Lera'] as int?,
      customerName: json['customerName'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$InvoiceDataResponseToJson(
        InvoiceDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNo': instance.invoiceNo,
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
      'customerName': instance.customerName,
      'date': instance.date,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      count: json['count'] as num?,
      unitAr: json['unit_ar'] as String?,
      unitEn: json['unit_en'] as String?,
      priceDoler: json['price_Doler'] as num?,
      priceLera: json['price_Lera'] as num?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
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
