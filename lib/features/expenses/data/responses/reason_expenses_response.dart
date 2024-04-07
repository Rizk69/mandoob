import 'package:json_annotation/json_annotation.dart';

part 'reason_expenses_response.g.dart';

@JsonSerializable()
class ReasonExpensesResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "reason_expense")
  List<ReasonExpenseResponse>? reasonExpense;

  ReasonExpensesResponse({
    this.status,
    this.message,
    this.reasonExpense,
  });

  factory ReasonExpensesResponse.fromJson(Map<String, dynamic> json) =>
      _$ReasonExpensesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonExpensesResponseToJson(this);
}

@JsonSerializable()
class ReasonExpenseResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  ReasonExpenseResponse({
    this.id,
    this.nameAr,
    this.nameEn,
  });

  factory ReasonExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$ReasonExpenseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonExpenseResponseToJson(this);
}
