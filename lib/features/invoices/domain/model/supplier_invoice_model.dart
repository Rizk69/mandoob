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
  int totalDoler;
  int totalLera;
  String date;

  SupplierInvoiceDataModel({
    required this.totalDoler,
    required   this.totalLera,
    required   this.date});



}