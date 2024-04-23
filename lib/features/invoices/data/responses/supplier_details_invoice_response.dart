import 'package:json_annotation/json_annotation.dart';

part 'supplier_details_invoice_response.g.dart';

@JsonSerializable()
class SupplierDetailsInvoiceResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "invoices")
  List<InvoiceResponse>? invoices;

  SupplierDetailsInvoiceResponse({
    required this.status,
    required this.message,
    required this.invoices,
  });

  factory SupplierDetailsInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierDetailsInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDetailsInvoiceResponseToJson(this);
}

@JsonSerializable()
class InvoiceResponse {
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

  @JsonKey(name: "products")
  List<ProductResponse>? products;

  InvoiceResponse({
    required this.id,
    required this.invoiceNo,
    required this.priceDoler,
    required this.priceLera,
    required this.customerName,
    required this.date,
    required this.products,
  });

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
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
  num? priceDoler;

  @JsonKey(name: "price_Lera")
  num? priceLera;

  @JsonKey(name: "date")
  String? date;

  ProductResponse({
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

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
