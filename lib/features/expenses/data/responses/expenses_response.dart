import 'package:json_annotation/json_annotation.dart';

part 'expenses_response.g.dart';

@JsonSerializable()
class ExpensesResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "expenses")
  List<ExpenseDataResponse>? expenses;

  ExpensesResponse({
    this.status,
    this.message,
    this.expenses,
  });

  factory ExpensesResponse.fromJson(Map<String, dynamic> json) => _$ExpensesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpensesResponseToJson(this);
}

@JsonSerializable()
class ExpenseDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "reason_expense_ar")
  String? reasonExpenseAr;

  @JsonKey(name: "reason_expense_en")
  String? reasonExpenseEn;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "count")
  String? count;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "status_ar")
  String? statusAr;

  @JsonKey(name: "status_en")
  String? statusEn;

  ExpenseDataResponse({
    this.id,
    this.reasonExpenseAr,
    this.reasonExpenseEn,
    this.price,
    this.count,
    this.date,
    this.statusAr,
    this.statusEn,
  });

  factory ExpenseDataResponse.fromJson(Map<String, dynamic> json) => _$ExpenseDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDataResponseToJson(this);
}
