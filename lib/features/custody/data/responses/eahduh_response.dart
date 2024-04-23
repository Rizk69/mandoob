import 'package:json_annotation/json_annotation.dart';

part 'eahduh_response.g.dart';

@JsonSerializable(explicitToJson: true)
class EahduhResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "balance")
  BalanceData? balance;

  @JsonKey(name: "data")
  List<ProductData>? data;

  EahduhResponse({
    this.status,
    this.message,
    this.balance,
    this.data,
  });

  factory EahduhResponse.fromJson(Map<String, dynamic> json) =>
      _$EahduhResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EahduhResponseToJson(this);
}

@JsonSerializable()
class BalanceData {
  @JsonKey(name: "total_Doler")
  String? totalDoler;

  @JsonKey(name: "total_Lera")
  String? totalLera;

  BalanceData({
    this.totalDoler,
    this.totalLera,
  });

  factory BalanceData.fromJson(Map<String, dynamic> json) =>
      _$BalanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceDataToJson(this);
}

@JsonSerializable()
class ProductData {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "count")
  int? count;

  @JsonKey(name: "unit_ar")
  String? unitAr;

  @JsonKey(name: "unit_en")
  String? unitEn;

  @JsonKey(name: "price_Lera")
  String? priceLera;

  @JsonKey(name: "price_Doler")
  String? priceDoler;

  @JsonKey(name: "favorite_product")
  bool? favoriteProduct;

  ProductData({
    this.id,
    this.nameAr,
    this.nameEn,
    this.image,
    this.count,
    this.unitAr,
    this.unitEn,
    this.priceLera,
    this.priceDoler,
    this.favoriteProduct,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
