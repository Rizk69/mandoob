import 'package:json_annotation/json_annotation.dart';

part 'trader_invoice_response.g.dart';

@JsonSerializable()
class TraderInvoiceResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<TraderInvoiceDataResponse>? data;

  TraderInvoiceResponse({this.status, this.message, this.data});

  factory TraderInvoiceResponse.fromJson(Map<String, dynamic> json) => _$TraderInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TraderInvoiceResponseToJson(this);
}

@JsonSerializable()
class TraderInvoiceDataResponse {
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



  TraderInvoiceDataResponse({this.id, this.invoiceNo, this.priceDoler, this.priceLera, this.customerName, this.date});

  factory TraderInvoiceDataResponse.fromJson(Map<String, dynamic> json) => _$TraderInvoiceDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TraderInvoiceDataResponseToJson(this);
}


