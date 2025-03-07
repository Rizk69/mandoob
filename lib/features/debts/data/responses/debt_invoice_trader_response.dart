import 'package:json_annotation/json_annotation.dart';

part 'debt_invoice_trader_response.g.dart';

@JsonSerializable()
class DebtInvoiceTraderResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  DebtInvoiceTraderDataResponse? data;

  DebtInvoiceTraderResponse({
    this.status,
    this.message,
    this.data,
  });

  factory DebtInvoiceTraderResponse.fromJson(Map<String, dynamic> json) => _$DebtInvoiceTraderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DebtInvoiceTraderResponseToJson(this);
}

@JsonSerializable()
class DebtInvoiceTraderDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "trader_name")
  String? traderName;

  @JsonKey(name: "trader_phone")
  String? traderPhone;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "invoice_no")
  String? invoiceNo;

  @JsonKey(name: "debt_price_Doler")
  String? debtPriceDoler;

  @JsonKey(name: "debt_price_Lera")
  String? debtPriceLera;

  @JsonKey(name: "pay_price_Doler")
  String? payPriceDoler;

  @JsonKey(name: "pay_price_Lera")
  String? payPriceLera;

  @JsonKey(name: "rest_price_Doler")
  String? restPriceDoler;

  @JsonKey(name: "rest_price_Lera")
  String? restPriceLera;

  DebtInvoiceTraderDataResponse({
    this.id,
    this.traderName,
    this.traderPhone,
    this.date,
    this.invoiceNo,
    this.debtPriceDoler,
    this.debtPriceLera,
    this.payPriceDoler,
    this.payPriceLera,
    this.restPriceDoler,
    this.restPriceLera,
  });

  factory DebtInvoiceTraderDataResponse.fromJson(Map<String, dynamic> json) => _$DebtInvoiceTraderDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DebtInvoiceTraderDataResponseToJson(this);
}
