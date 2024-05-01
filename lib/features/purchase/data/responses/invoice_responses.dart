import 'package:json_annotation/json_annotation.dart';

part 'invoice_responses.g.dart';

@JsonSerializable()
class InvoicePurchaseResponses {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "invoice")
  InvoiceResponses? invoice;

  InvoicePurchaseResponses({
    this.status,
    this.message,
    this.invoice,
  });

  factory InvoicePurchaseResponses.fromJson(Map<String, dynamic> json) =>
      _$InvoicePurchaseResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$InvoicePurchaseResponsesToJson(this);
}

@JsonSerializable()
class InvoiceResponses {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "product_name")
  String? productName;

  @JsonKey(name: "count")
  int? count;

  @JsonKey(name: "price_Doler")
  String? priceDoler;

  @JsonKey(name: "price_Lera")
  String? priceLera;

  @JsonKey(name: "pay_price_Doler")
  String? payPriceDoler;

  @JsonKey(name: "pay_price_Lera")
  String? payPriceLera;

  @JsonKey(name: "rest_price_Doler")
  String? restPriceDoler;

  @JsonKey(name: "rest_price_Lera")
  String? restPriceLera;

  @JsonKey(name: "customerName")
  String? customerName;

  @JsonKey(name: "customerphone")
  String? customerPhone;

  @JsonKey(name: "pay_ar")
  String? payAr;

  @JsonKey(name: "pay_en")
  String? payEn;

  @JsonKey(name: "date")
  String? date;

  InvoiceResponses({
    this.id,
    this.productName,
    this.count,
    this.priceDoler,
    this.priceLera,
    this.payPriceDoler,
    this.payPriceLera,
    this.restPriceDoler,
    this.restPriceLera,
    this.customerName,
    this.customerPhone,
    this.payAr,
    this.payEn,
    this.date,
  });

  factory InvoiceResponses.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceResponsesToJson(this);
}
