import 'package:json_annotation/json_annotation.dart';

part 'trades_response.g.dart';

@JsonSerializable()
class TradesResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<TradesDataResponse>? trades;

  TradesResponse({
    this.status,
    this.message,
    this.trades,
  });

  factory TradesResponse.fromJson(Map<String, dynamic> json) => _$TradesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TradesResponseToJson(this);
}



@JsonSerializable()
class TradesDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "img")
  String? img;

  @JsonKey(name: "customer_name")
  String? customer_name;

  @JsonKey(name: "phone")
  String? phone;


  @JsonKey(name: "price_ar")
  String? priceAr;
  @JsonKey(name: "price_en")
  String? priceEn;
  @JsonKey(name: "address")
  String? address;


  @JsonKey(name: "select_custoomer")
  bool? selectCustomer;

  TradesDataResponse({
    this.id,
    this.img,
    this.customer_name,
    this.phone,
    this.selectCustomer,
    this.address,
    this.priceEn,
    this.priceAr,
  });

  factory TradesDataResponse.fromJson(Map<String, dynamic> json) => _$TradesDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TradesDataResponseToJson(this);
}