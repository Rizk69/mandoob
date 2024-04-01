import 'package:json_annotation/json_annotation.dart';

part 'company_products_response.g.dart';

@JsonSerializable()
class CompanyProductsResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "products")
  List<ProductsCompanyResponse>? products;

  CompanyProductsResponse({this.status, this.message, this.products});

  factory CompanyProductsResponse.fromJson(Map<String, dynamic> json) => _$CompanyProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyProductsResponseToJson(this);
}

@JsonSerializable()
class ProductsCompanyResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "img")
  String? img;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "unit")
  UnitResponse? unit;

  @JsonKey(name: "unit_category")
  UnitResponse? unitCategory;

  @JsonKey(name: "unit_sub_category")
  UnitResponse? unitSubCategory;

  ProductsCompanyResponse({this.id, this.img, this.nameAr, this.nameEn, this.unit, this.unitCategory, this.unitSubCategory});

  factory ProductsCompanyResponse.fromJson(Map<String, dynamic> json) => _$ProductsCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsCompanyResponseToJson(this);
}

@JsonSerializable()
class UnitResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "count")
  String? count;

  @JsonKey(name: "type")
  int? type;

  UnitResponse({this.id, this.nameAr, this.nameEn, this.count});

  factory UnitResponse.fromJson(Map<String, dynamic> json) => _$UnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitResponseToJson(this);
}
