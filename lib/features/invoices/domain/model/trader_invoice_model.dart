class TraderInvoiceModel {
  bool status;
  String message;
  List<TraderInvoiceDataModel> data;

  TraderInvoiceModel(
      {required this.status, required this.message, required this.data});
}

class TraderInvoiceDataModel {
  int id;
  String invoiceNo;
  num priceDoler;
  num priceLera;
  String customerName;
  String date;

  TraderInvoiceDataModel(
      {required this.id,
      required this.invoiceNo,
      required this.priceDoler,
      required this.priceLera,
      required this.customerName,
      required this.date});
}
