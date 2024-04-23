class DebtInvoiceTraderModel {
  bool status;

  String message;

  DebtInvoiceTraderDataModel? data;

  DebtInvoiceTraderModel({
    required this.status,
    required this.message,
    required this.data,
  });
}

class DebtInvoiceTraderDataModel {
  int id;

  String traderName;

  String traderPhone;

  String date;

  String invoiceNo;

  String debtPriceDoler;

  String debtPriceLera;

  String payPriceDoler;

  String payPriceLera;

  String restPriceDoler;

  String restPriceLera;

  DebtInvoiceTraderDataModel({
    required this.id,
    required this.traderName,
    required this.traderPhone,
    required this.date,
    required this.invoiceNo,
    required this.debtPriceDoler,
    required this.debtPriceLera,
    required this.payPriceDoler,
    required this.payPriceLera,
    required this.restPriceDoler,
    required this.restPriceLera,
  });
}
