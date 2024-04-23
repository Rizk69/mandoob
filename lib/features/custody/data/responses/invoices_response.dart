import 'package:json_annotation/json_annotation.dart';

part 'invoices_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoicesResponse {
  @JsonKey(name: "status")
  bool status;

  @JsonKey(name: "message")
  String message;

  @JsonKey(name: "invoice")
  InvoiceDataResponse? invoice;

  InvoicesResponse({
    required this.status,
    required this.message,
    required this.invoice,
  });

  factory InvoicesResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicesResponseToJson(this);
}

@JsonSerializable()
class InvoiceDataResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "invoiceNo")
  String invoiceNo;

  @JsonKey(name: "price_Doler")
  String priceDoler;

  @JsonKey(name: "price_Lera")
  String priceLera;

  @JsonKey(name: "pay_price_Doler")
  String payPriceDoler;

  @JsonKey(name: "pay_price_Lera")
  String payPriceLera;

  @JsonKey(name: "rest_price_Doler")
  String restPriceDoler;

  @JsonKey(name: "rest_price_Lera")
  String restPriceLera;

  @JsonKey(name: "customerName")
  String customerName;

  @JsonKey(name: "customerphone")
  String customerPhone;

  @JsonKey(name: "pay_ar")
  String paymentMethodAr;

  @JsonKey(name: "pay_en")
  String paymentMethodEn;

  @JsonKey(name: "date")
  String date;

  @JsonKey(name: "products")
  List<ProductDataResponse> products;

  InvoiceDataResponse({
    required this.id,
    required this.invoiceNo,
    required this.priceDoler,
    required this.priceLera,
    required this.payPriceDoler,
    required this.payPriceLera,
    required this.restPriceDoler,
    required this.restPriceLera,
    required this.customerName,
    required this.customerPhone,
    required this.paymentMethodAr,
    required this.paymentMethodEn,
    required this.date,
    required this.products,
  });

  factory InvoiceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDataResponseToJson(this);
}

@JsonSerializable()
class ProductDataResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name_ar")
  String nameAr;

  @JsonKey(name: "name_en")
  String nameEn;

  @JsonKey(name: "count")
  int count;

  @JsonKey(name: "unit_ar")
  String unitAr;

  @JsonKey(name: "unit_en")
  String unitEn;

  @JsonKey(name: "price_Doler")
  String priceDoler;

  @JsonKey(name: "price_Lera")
  String priceLera;

  @JsonKey(name: "date")
  String date;

  ProductDataResponse({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.count,
    required this.unitAr,
    required this.unitEn,
    required this.priceDoler,
    required this.priceLera,
    required this.date,
  });

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);
}
