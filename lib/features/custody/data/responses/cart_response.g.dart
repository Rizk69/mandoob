// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      trader: json['trader'] == null
          ? null
          : TraderDataResponse.fromJson(json['trader'] as Map<String, dynamic>),
      total: json['total'] == null
          ? null
          : TotalDataResponse.fromJson(json['total'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'trader': instance.trader?.toJson(),
      'total': instance.total?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

TraderDataResponse _$TraderDataResponseFromJson(Map<String, dynamic> json) =>
    TraderDataResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TraderDataResponseToJson(TraderDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TotalDataResponse _$TotalDataResponseFromJson(Map<String, dynamic> json) =>
    TotalDataResponse(
      priceDoler: json['price_Doler'] as num?,
      priceLera: json['price_Lera'] as num?,
    );

Map<String, dynamic> _$TotalDataResponseToJson(TotalDataResponse instance) =>
    <String, dynamic>{
      'price_Doler': instance.priceDoler,
      'price_Lera': instance.priceLera,
    };

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) =>
    ProductDataResponse(
      id: json['id'] as int?,
      image: json['img'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      count: json['count'] as int?,
      unitAr: json['real_count_ar'] as String?,
      unitEn: json['real_count_en'] as String?,
      priceDoler: json['price_unit_Doler'] as num?,
      priceLera: json['price_unit_Lera'] as num?,
      quantity: json['quantity'] as int?,
      totalPriceDoler: json['Tprice_Doler'] as num?,
      totalPriceLera: json['Tprice_Lera'] as num?,
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.image,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'count': instance.count,
      'real_count_ar': instance.unitAr,
      'real_count_en': instance.unitEn,
      'price_unit_Doler': instance.priceDoler,
      'price_unit_Lera': instance.priceLera,
      'quantity': instance.quantity,
      'Tprice_Doler': instance.totalPriceDoler,
      'Tprice_Lera': instance.totalPriceLera,
    };
