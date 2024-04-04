// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyProductsResponse _$CompanyProductsResponseFromJson(
        Map<String, dynamic> json) =>
    CompanyProductsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              ProductsCompanyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyProductsResponseToJson(
        CompanyProductsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'products': instance.products,
    };

ProductsCompanyResponse _$ProductsCompanyResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsCompanyResponse(
      id: json['id'] as int?,
      img: json['img'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      unit: json['unit'] == null
          ? null
          : UnitResponse.fromJson(json['unit'] as Map<String, dynamic>),
      unitCategory: json['unit_category'] == null
          ? null
          : UnitResponse.fromJson(
              json['unit_category'] as Map<String, dynamic>),
      unitSubCategory: json['unit_sub_category'] == null
          ? null
          : UnitResponse.fromJson(
              json['unit_sub_category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsCompanyResponseToJson(
        ProductsCompanyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'unit': instance.unit,
      'unit_category': instance.unitCategory,
      'unit_sub_category': instance.unitSubCategory,
    };

UnitResponse _$UnitResponseFromJson(Map<String, dynamic> json) => UnitResponse(
      id: json['id'] as int?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      count: json['count'] as String?,
    )..type = json['type'] as int?;

Map<String, dynamic> _$UnitResponseToJson(UnitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'count': instance.count,
      'type': instance.type,
    };
