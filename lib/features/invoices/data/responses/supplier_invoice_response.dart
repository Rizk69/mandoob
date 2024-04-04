import 'package:json_annotation/json_annotation.dart';

part 'supplier_invoice_response.g.dart';

@JsonSerializable()
class SupplierInvoiceResponse  {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  DataSupplierInvoiceResponse? data;


  SupplierInvoiceResponse({this.status, this.message, this.data});


  factory SupplierInvoiceResponse.fromJson(Map<String, dynamic> json) => _$SupplierInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierInvoiceResponseToJson(this);

}



@JsonSerializable()
class DataSupplierInvoiceResponse {
  @JsonKey(name: "total_Doler")
  num? totalDoler;
  @JsonKey(name: "total_Lera")
  num? totalLera;
  @JsonKey(name: "date")
  String? date;



  DataSupplierInvoiceResponse({required this.totalDoler,required this.totalLera,required this.date});


  factory DataSupplierInvoiceResponse.fromJson(Map<String, dynamic> json) => _$DataSupplierInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataSupplierInvoiceResponseToJson(this);

}

