class SupplierDetailsInvoiceModel {
  bool status;
  String message;
  List<Invoice> invoices;

  SupplierDetailsInvoiceModel({
    required this.status,
    required this.message,
    required this.invoices,
  });
}

class Invoice {
  int id;
  String invoiceNo;
  String priceDoler;
  String priceLera;
  String customerName;
  String date;
  List<Product> products;

  Invoice({
    required this.id,
    required this.invoiceNo,
    required this.priceDoler,
    required this.priceLera,
    required this.customerName,
    required this.date,
    required this.products,
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
