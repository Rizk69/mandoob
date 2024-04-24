class PurchaseModel {
  bool status;

  String message;

  List<PurchaseProductModel> purchaseProductModel;

  PurchaseModel({
    required this.status,
    required this.message,
    required this.purchaseProductModel,
  });
}

class PurchaseProductModel {
  int id;

  String productName;

  num count;

  String unit;

  int purchasePrice;

  String currencyAr;

  String currencyEn;

  PurchaseProductModel({
    required this.id,
    required this.productName,
    required this.count,
    required this.unit,
    required this.purchasePrice,
    required this.currencyAr,
    required this.currencyEn,
  });
}
