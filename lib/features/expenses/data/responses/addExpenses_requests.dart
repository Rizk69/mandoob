import 'package:json_annotation/json_annotation.dart';
import 'package:image_picker/image_picker.dart'; // Import XFile

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
  XFile? image; // Use XFile instead of File

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

  static XFile? _fileFromJson(String? json) {
    return json != null ? XFile(json) : null; // Create XFile instance
  }

  static String? _fileToJson(XFile? file) {
    return file?.path;
  }
}
