import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'addExpenses_requests.g.dart';

@JsonSerializable()
class AddExpensesRequests {
  @JsonKey(name: "reason_expense_id")
  String? reasonExpenseId;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "currency_id")
  String? currencyId;

  @JsonKey(
    name: "image",
    fromJson: _fileFromJson,
    toJson: _fileToJson,
  )
  File? image;

  @JsonKey(name: "count")
  String? count;

  AddExpensesRequests({
    this.reasonExpenseId,
    this.price,
    this.currencyId,
    this.image,
    this.count,
  });

  factory AddExpensesRequests.fromJson(Map<String, dynamic> json) =>
      _$AddExpensesRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$AddExpensesRequestsToJson(this);

  static File? _fileFromJson(String? json) {
    return json != null ? File(json) : null;
  }

  static String? _fileToJson(File? file) {
    return file?.path;
  }
}
