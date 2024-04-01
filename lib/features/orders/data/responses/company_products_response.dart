import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_products_response.g.dart';

@JsonSerializable()
class CompanyProductsResponse {
  bool? status;
  String? message;
  List<ProductsCompanyResponse>? products;

  CompanyProductsResponse({this.status, this.message, this.products});

  CompanyProductsResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((v) {
        products?.add(ProductsCompanyResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    if (products != null) {
      map["products"] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductsCompanyResponse {
  int? id;
  String? img;
  String? nameAr;
  String? nameEn;
  UnitResponse? unit;
  UnitCategoryResponse? unitCategory;
  UnitSubCategoryResponse? unitSubCategory;

  ProductsCompanyResponse(
      {this.id,
      this.img,
      this.nameAr,
      this.nameEn,
      this.unit,
      this.unitCategory,
      this.unitSubCategory});

  ProductsCompanyResponse.fromJson(dynamic json) {
    id = json["id"];
    img = json["img"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    unit = json["unit"] != null ? UnitResponse.fromJson(json["unit"]) : null;
    unitCategory = json["unit_category"] != null
        ? UnitCategoryResponse.fromJson(json["unitCategory"])
        : null;
    unitSubCategory = json["unit_sub_category"] != null
        ? UnitSubCategoryResponse.fromJson(json["unitSubCategory"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["img"] = img;
    map["name_ar"] = nameAr;
    map["name_en"] = nameEn;
    if (unit != null) {
      map["unit"] = unit?.toJson();
    }
    if (unitCategory != null) {
      map["unit_category"] = unitCategory?.toJson();
    }
    if (unitSubCategory != null) {
      map["unit_sub_category"] = unitSubCategory?.toJson();
    }
    return map;
  }
}

class UnitSubCategoryResponse {
  int? id;
  String? nameAr;
  String? nameEn;
  String? count;

  UnitSubCategoryResponse({this.id, this.nameAr, this.nameEn, this.count});

  UnitSubCategoryResponse.fromJson(dynamic json) {
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name_ar"] = nameAr;
    map["name_en"] = nameEn;
    map["count"] = count;
    return map;
  }
}

class UnitCategoryResponse {
  int? id;
  String? nameAr;
  String? nameEn;
  String? count;

  UnitCategoryResponse({this.id, this.nameAr, this.nameEn, this.count});

  UnitCategoryResponse.fromJson(dynamic json) {
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name_ar"] = nameAr;
    map["name_en"] = nameEn;
    map["count"] = count;
    return map;
  }
}

class UnitResponse {
  int? id;
  String? nameAr;
  String? nameEn;
  String? count;

  UnitResponse({this.id, this.nameAr, this.nameEn, this.count});

  UnitResponse.fromJson(dynamic json) {
    id = json["id"];
    nameAr = json["name_ar"];
    nameEn = json["name_en"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name_ar"] = nameAr;
    map["name_en"] = nameEn;
    map["count"] = count;
    return map;
  }
}
