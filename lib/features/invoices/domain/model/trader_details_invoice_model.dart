class TraderDetailsInvoiceModel {
  bool status;
  String message;
  InvoiceData data;
  List<Product> products;

  TraderDetailsInvoiceModel({
    required this.status,
    required this.message,
    required this.data,
    required this.products,
  });
}

class InvoiceData {
  int id;
  String invoiceNo;
  String priceDoler;
  String priceLera;
  String customerName;
  String date;

  InvoiceData({
    required this.id,
    required this.invoiceNo,
    required this.priceDoler,
    required this.priceLera,
    required this.customerName,
    required this.date,
  });
}

class Product {
  int id;
  String nameAr;
  String nameEn;
  num count;
  String unitAr;
  String unitEn;
  String priceDoler;
  String priceLera;
  String date;

  Product({
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
}
