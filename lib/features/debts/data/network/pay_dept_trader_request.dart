import 'package:json_annotation/json_annotation.dart';

part 'pay_dept_trader_request.g.dart';

@JsonSerializable()
class PayDeptTraderRequest {
  @JsonKey(name: "trader_id")
  String? traderId;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "currency_id")
  String? currencyId;

  @JsonKey(name: "due_date")
  String? dueDate;

  PayDeptTraderRequest({
    this.traderId,
    this.price,
    this.currencyId,
    this.dueDate,
  });

  factory PayDeptTraderRequest.fromJson(Map<String, dynamic> json) =>
      _$PayDeptTraderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayDeptTraderRequestToJson(this);
}
