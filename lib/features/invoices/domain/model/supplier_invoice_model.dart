class SupplierInvoiceModel {
  bool status;
  String message;
  SupplierInvoiceDataModel data;

  SupplierInvoiceModel({
    required this.status,
    required this.message,
    required this.data});



}

class SupplierInvoiceDataModel {
  num totalDoler;
  num totalLera;
  String date;

  SupplierInvoiceDataModel({
    required this.totalDoler,
    required   this.totalLera,
    required   this.date});



}