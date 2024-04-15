import 'package:json_annotation/json_annotation.dart';

part 'debt_trader_response.g.dart';

@JsonSerializable()
class DebtTraderResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "depts")
  List<DebtDetailResponse>? debts;

  DebtTraderResponse({
    this.status,
    this.message,
    this.debts,
  });

  factory DebtTraderResponse.fromJson(Map<String, dynamic> json) => _$DebtTraderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DebtTraderResponseToJson(this);
}

@JsonSerializable()
class DebtDetailResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "trader_name")
  String? traderName;

  @JsonKey(name: "debt_Doler")
  num? debtDoler;

  @JsonKey(name: "debt_Lera")
  num? debtLera;

  @JsonKey(name: "last_date")
  String? lastDate;

  @JsonKey(name: "due_date")
  String? dueDate;

  DebtDetailResponse({
    this.id,
    this.traderName,
    this.debtDoler,
    this.debtLera,
    this.lastDate,
    this.dueDate,
  });

  factory DebtDetailResponse.fromJson(Map<String, dynamic> json) => _$DebtDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DebtDetailResponseToJson(this);
}
