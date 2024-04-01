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
          ?.map(ProductsCompanyResponse.fromJson)
          .toList(),
    );

Map<String, dynamic> _$CompanyProductsResponseToJson(
        CompanyProductsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'products': instance.products,
    };
