import 'package:json_annotation/json_annotation.dart';

part 'pay_debt_trader_response.g.dart';


@JsonSerializable()
class PayDebtTraderResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "invoice_id")
  int? invoiceId;

  PayDebtTraderResponse({
    this.status,
    this.message,
    this.invoiceId,
  });

  factory PayDebtTraderResponse.fromJson(Map<String, dynamic> json) => _$PayDebtTraderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PayDebtTraderResponseToJson(this);
}



