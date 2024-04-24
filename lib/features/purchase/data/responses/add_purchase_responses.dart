import 'package:json_annotation/json_annotation.dart';

part 'add_purchase_responses.g.dart';

@JsonSerializable()
class AddPurchaseResponses {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "sell_purchase_id")
  int? sellPurchaseId;

  AddPurchaseResponses({
    this.status,
    this.message,
    this.sellPurchaseId,
  });

  factory AddPurchaseResponses.fromJson(Map<String, dynamic> json) =>
      _$AddPurchaseResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$AddPurchaseResponsesToJson(this);
}
