class InvoicesModel {
  bool status;
  String message;
  InvoiceModel? invoice;

  InvoicesModel({
    required this.status,
    required this.message,
    required this.invoice,
  });
}

class InvoiceModel {
  int id;
  String invoiceNo;
  num priceDoler;
  num priceLera;
  num payPriceDoler;
  num payPriceLera;
  num restPriceDoler;
  num restPriceLera;
  String customerName;
  String customerPhone;
  String paymentMethodAr;
  String paymentMethodEn;
  String date;
  List<ProductModel> products;

  InvoiceModel({
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
}

class ProductModel {
  int id;
  String nameAr;
  String nameEn;
  int count;
  String unitAr;
  String unitEn;
  num priceDoler;
  num priceLera;
  String date;

  ProductModel({
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
