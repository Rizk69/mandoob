// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseResponses _$PurchaseResponsesFromJson(Map<String, dynamic> json) =>
    PurchaseResponses(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      purchaseProductResponse: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PurchaseProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseResponsesToJson(PurchaseResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.purchaseProductResponse,
    };

PurchaseProductResponse _$PurchaseProductResponseFromJson(
        Map<String, dynamic> json) =>
    PurchaseProductResponse(
      id: json['id'] as int?,
      productName: json['product_name'] as String?,
      count: json['count'] as num?,
      unit: json['unit'] as String?,
      purchasePrice: json['pruchase_price'] as int?,
      currencyAr: json['currency_ar'] as String?,
      currencyEn: json['currency_en'] as String?,
    );

Map<String, dynamic> _$PurchaseProductResponseToJson(
        PurchaseProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'count': instance.count,
      'unit': instance.unit,
      'pruchase_price': instance.purchasePrice,
      'currency_ar': instance.currencyAr,
      'currency_en': instance.currencyEn,
    };
