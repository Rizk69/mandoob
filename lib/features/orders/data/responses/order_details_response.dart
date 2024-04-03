import 'package:json_annotation/json_annotation.dart';

part 'order_details_response.g.dart';

@JsonSerializable()
class OrderDetailsResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "products")
  List<ProductDataResponse>? products;

  @JsonKey(name: "order")
  OrderDetailsDataResponse? order;

  OrderDetailsResponse({this.status, this.message, this.products, this.order});

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseToJson(this);
}

@JsonSerializable()
class ProductDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "img")
  String? img;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "count")
  num? count;

  @JsonKey(name: "unit_ar")
  String? unit_ar;

  @JsonKey(name: "unit_en")
  String? unit_en;

  ProductDataResponse(
      {this.id,
      this.img,
      this.nameAr,
      this.nameEn,
      this.count,
      this.unit_ar,
      this.unit_en});

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);
}

@JsonSerializable()
class OrderDetailsDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "orderNo")
  String? orderNo;

  @JsonKey(name: "status_ar")
  String? status_ar;

  @JsonKey(name: "status_en")
  String? status_en;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "price_Doler")
  num? price_Doler;

  @JsonKey(name: "price_Lera")
  num? price_Lera;

  OrderDetailsDataResponse(
      {this.id,
      this.orderNo,
      this.status_ar,
      this.status_en,
      this.date,
      this.price_Doler,
      this.price_Lera});

  factory OrderDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsDataResponseToJson(this);
}
