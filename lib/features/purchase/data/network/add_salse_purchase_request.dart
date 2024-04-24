import 'package:json_annotation/json_annotation.dart';

part 'add_salse_purchase_request.g.dart';

@JsonSerializable()
class AddSalsePurchaseRequest {
  @JsonKey(name: "purchese_id")
  String? purcheseId;
  @JsonKey(name: "count")
  String? count;
  @JsonKey(name: "customer_id")
  String? customerId;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "currency_id")
  String? currencyId;

  AddSalsePurchaseRequest({
    this.customerId,
    this.price,
    this.count,
    this.currencyId,
    this.purcheseId,
  });

  factory AddSalsePurchaseRequest.fromJson(Map<String, dynamic> json) =>
      _$AddSalsePurchaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddSalsePurchaseRequestToJson(this);
}
