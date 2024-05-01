// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsResponse _$OrderDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: json['order'] == null
          ? null
          : OrderDetailsDataResponse.fromJson(
              json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsResponseToJson(
        OrderDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'products': instance.products,
      'order': instance.order,
    };

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) =>
    ProductDataResponse(
      id: json['id'] as int?,
      img: json['img'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      count: json['count'] as num?,
      unit_ar: json['unit_ar'] as String?,
      unit_en: json['unit_en'] as String?,
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'count': instance.count,
      'unit_ar': instance.unit_ar,
      'unit_en': instance.unit_en,
    };

OrderDetailsDataResponse _$OrderDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsDataResponse(
      id: json['id'] as int?,
      orderNo: json['orderNo'] as String?,
      status_ar: json['status_ar'] as String?,
      status_en: json['status_en'] as String?,
      date: json['date'] as String?,
      price_Doler: json['price_Doler'] as String?,
      price_Lera: json['price_Lera'] as String?,
    );

Map<String, dynamic> _$OrderDetailsDataResponseToJson(
        OrderDetailsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNo': instance.orderNo,
      'status_ar': instance.status_ar,
      'status_en': instance.status_en,
      'date': instance.date,
      'price_Doler': instance.price_Doler,
      'price_Lera': instance.price_Lera,
    };
