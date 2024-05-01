import 'package:json_annotation/json_annotation.dart';

part 'pay_purchase_request.g.dart';

@JsonSerializable()
class PayPurchaseRequest {
  @JsonKey(name: "sell_purchase_id")
  String? sellPurchaseId;

  @JsonKey(name: "pay_Doler")
  String? payDoler;

  @JsonKey(name: "pay_Lera")
  String? payLera;

  @JsonKey(name: "due_date")
  String? dueDate;


  PayPurchaseRequest({
    this.sellPurchaseId,
    this.dueDate,
    this.payDoler,
    this.payLera,
  });

  factory PayPurchaseRequest.fromJson(Map<String, dynamic> json) =>
      _$PayPurchaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayPurchaseRequestToJson(this);
}
