import 'package:json_annotation/json_annotation.dart';

part 'confirm_purchase_request.g.dart';

@JsonSerializable()
class ConfirmPurchaseRequest {
  @JsonKey(name: "sell_purchase_id")
  String? sellPurchaseId;

  @JsonKey(name: "pay")
  String? pay;

  ConfirmPurchaseRequest({this.pay, this.sellPurchaseId});

  factory ConfirmPurchaseRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPurchaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmPurchaseRequestToJson(this);
}
