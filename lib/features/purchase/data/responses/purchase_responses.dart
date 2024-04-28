import 'package:json_annotation/json_annotation.dart';

part 'purchase_responses.g.dart';

@JsonSerializable()
class PurchaseResponses {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<PurchaseProductResponse>? purchaseProductResponse;

  PurchaseResponses({
    this.status,
    this.message,
    this.purchaseProductResponse,
  });

  factory PurchaseResponses.fromJson(Map<String, dynamic> json) =>
      _$PurchaseResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseResponsesToJson(this);
}

@JsonSerializable()
class PurchaseProductResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "product_name")
  String? productName;

  @JsonKey(name: "count")
  num? count;

  @JsonKey(name: "unit")
  String? unit;

  @JsonKey(name: "pruchase_price")
  int? purchasePrice;

  @JsonKey(name: "currency_ar")
  String? currencyAr;

  @JsonKey(name: "currency_en")
  String? currencyEn;

  PurchaseProductResponse({
    this.id,
    this.productName,
    this.count,
    this.unit,
    this.purchasePrice,
    this.currencyAr,
    this.currencyEn,
  });

  factory PurchaseProductResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseProductResponseToJson(this);
}
