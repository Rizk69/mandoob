import 'package:json_annotation/json_annotation.dart';

part 'trader_details_invoice_response.g.dart';

@JsonSerializable()
class TraderDetailsInvoiceResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  InvoiceDataResponse? data;

  @JsonKey(name: "products")
  List<ProductResponse>? products;

  TraderDetailsInvoiceResponse({
    this.status,
    this.message,
    this.data,
    this.products,
  });

  factory TraderDetailsInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$TraderDetailsInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TraderDetailsInvoiceResponseToJson(this);
}

@JsonSerializable()
class InvoiceDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "invoiceNo")
  String? invoiceNo;

  @JsonKey(name: "price_Doler")
  String? priceDoler;

  @JsonKey(name: "price_Lera")
  String? priceLera;

  @JsonKey(name: "customerName")
  String? customerName;

  @JsonKey(name: "date")
  String? date;

  InvoiceDataResponse({
    this.id,
    this.invoiceNo,
    this.priceDoler,
    this.priceLera,
    this.customerName,
    this.date,
  });

  factory InvoiceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDataResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "count")
  num? count;

  @JsonKey(name: "unit_ar")
  String? unitAr;

  @JsonKey(name: "unit_en")
  String? unitEn;

  @JsonKey(name: "price_Doler")
  String? priceDoler;

  @JsonKey(name: "price_Lera")
  String? priceLera;

  @JsonKey(name: "date")
  String? date;

  ProductResponse({
    this.id,
    this.nameAr,
    this.nameEn,
    this.count,
    this.unitAr,
    this.unitEn,
    this.priceDoler,
    this.priceLera,
    this.date,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
