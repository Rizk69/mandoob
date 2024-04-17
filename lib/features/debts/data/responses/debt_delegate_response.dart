import 'package:json_annotation/json_annotation.dart';

part 'debt_delegate_response.g.dart';


@JsonSerializable()
class DebtDelegateResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "debt_delivery")
  List<DebtDelegateDataResponse>? debts;

  DebtDelegateResponse({
    this.status,
    this.message,
    this.debts,
  });

  factory DebtDelegateResponse.fromJson(Map<String, dynamic> json) => _$DebtDelegateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DebtDelegateResponseToJson(this);
}


@JsonSerializable()
class DebtDelegateDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "debt_price_Doler")
  num? debtPriceDoler;
  @JsonKey(name: "debt_price_Lera")
  num? debtPriceLera;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "reason_expenses_name_ar")
  String? reasonExpensesNameAr;
  @JsonKey(name: "reason_expenses_name_en")
  String? reasonExpensesNameEn;

  DebtDelegateDataResponse({
    this.id,
    this.debtPriceDoler,
    this.debtPriceLera,
    this.date,
    this.reasonExpensesNameAr,
    this.reasonExpensesNameEn,
  });

  factory DebtDelegateDataResponse.fromJson(Map<String, dynamic> json) => _$DebtDelegateDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DebtDelegateDataResponseToJson(this);
}
