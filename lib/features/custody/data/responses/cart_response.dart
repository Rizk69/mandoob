import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CartResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "trader")
  TraderDataResponse? trader;

  @JsonKey(name: "total")
  TotalDataResponse? total;

  @JsonKey(name: "data")
  List<ProductDataResponse>? data;

  CartResponse({
    this.status,
    this.message,
    this.trader,
    this.total,
    this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}

@JsonSerializable()
class TraderDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  TraderDataResponse({
    this.id,
    this.name,
  });

  factory TraderDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TraderDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TraderDataResponseToJson(this);
}

@JsonSerializable()
class TotalDataResponse {
  @JsonKey(name: "price_Doler")
  String? priceDoler;

  @JsonKey(name: "price_Lera")
  String? priceLera;

  TotalDataResponse({
    this.priceDoler,
    this.priceLera,
  });

  factory TotalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalDataResponseToJson(this);
}

@JsonSerializable()
class ProductDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "img")
  String? image;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "count")
  int? count;

  @JsonKey(name: "real_count_ar")
  String? unitAr;

  @JsonKey(name: "real_count_en")
  String? unitEn;

  @JsonKey(name: "price_unit_Doler")
  String? priceDoler;

  @JsonKey(name: "price_unit_Lera")
  String? priceLera;

  @JsonKey(name: "quantity")
  int? quantity;

  @JsonKey(name: "Tprice_Doler")
  String? totalPriceDoler;

  @JsonKey(name: "Tprice_Lera")
  String? totalPriceLera;

  ProductDataResponse({
    this.id,
    this.image,
    this.nameAr,
    this.nameEn,
    this.count,
    this.unitAr,
    this.unitEn,
    this.priceDoler,
    this.priceLera,
    this.quantity,
    this.totalPriceDoler,
    this.totalPriceLera,
  });

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);
}
