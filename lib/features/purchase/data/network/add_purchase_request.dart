import 'package:json_annotation/json_annotation.dart';

part 'add_purchase_request.g.dart';

@JsonSerializable()
class AddPurchaseRequest {
  @JsonKey(name: "product_name")
  String? productName;

  @JsonKey(name: "count")
  String? count;

  @JsonKey(name: "unit")
  String? unit;

  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "currency_id")
  String? currencyId;

  AddPurchaseRequest({
    this.productName,
    this.price,
    this.count,
    this.currencyId,
    this.unit,
  });

  factory AddPurchaseRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPurchaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddPurchaseRequestToJson(this);
}
