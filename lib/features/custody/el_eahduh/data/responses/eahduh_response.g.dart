// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eahduh_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EahduhResponse _$EahduhResponseFromJson(Map<String, dynamic> json) =>
    EahduhResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      balance: json['balance'] == null
          ? null
          : BalanceData.fromJson(json['balance'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EahduhResponseToJson(EahduhResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'balance': instance.balance?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

BalanceData _$BalanceDataFromJson(Map<String, dynamic> json) => BalanceData(
      totalDoler: json['total_Doler'] as num?,
      totalLera: json['total_Lera'] as num?,
    );

Map<String, dynamic> _$BalanceDataToJson(BalanceData instance) =>
    <String, dynamic>{
      'total_Doler': instance.totalDoler,
      'total_Lera': instance.totalLera,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      image: json['image'] as String?,
      count: json['count'] as int?,
      unitAr: json['unit_ar'] as String?,
      unitEn: json['unit_en'] as String?,
      priceLera: json['price_Lera'] as num?,
      priceDoler: json['price_Doler'] as num?,
      favoriteProduct: json['favorite_product'] as bool?,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'image': instance.image,
      'count': instance.count,
      'unit_ar': instance.unitAr,
      'unit_en': instance.unitEn,
      'price_Lera': instance.priceLera,
      'price_Doler': instance.priceDoler,
      'favorite_product': instance.favoriteProduct,
    };
