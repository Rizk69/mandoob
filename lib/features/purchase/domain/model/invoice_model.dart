

class InvoicePurchaseModel{
  bool status;

  String message;

  InvoiceModel invoice;

  InvoicePurchaseModel({
    required this.status,
    required  this.message,
    required this.invoice,
  });


}

class InvoiceModel {
  int id;

  String productName;

  int count;

  String priceDoler;

  String priceLera;

  String payPriceDoler;

  String payPriceLera;

  String restPriceDoler;

  String restPriceLera;

  String customerName;

  String customerPhone;

  String payAr;

  String payEn;

  String date;

  InvoiceModel({
    required  this.id,
    required  this.productName,
    required  this.count,
    required   this.priceDoler,
    required   this.priceLera,
    required   this.payPriceDoler,
    required  this.payPriceLera,
    required  this.restPriceDoler,
    required   this.restPriceLera,
    required  this.customerName,
    required  this.customerPhone,
    required  this.payAr,
    required  this.payEn,
    required  this.date,
  });


}
