class EahduhOrderModel {
  bool status;
  String message;
  Balance balance;
  List<EahduhOrderDataModel> data;

  EahduhOrderModel({
    required this.status,
    required this.message,
    required this.balance,
    required this.data,
  });
}


class Balance {
  String totalDoler;
  String totalLera;

  Balance({
    required this.totalDoler,
    required this.totalLera,
  });

}

class EahduhOrderDataModel {
  int id;
  String nameAr;
  String nameEn;
  dynamic image;
  int count;
  String unitAr;
  String unitEn;
  String priceLera;
  String priceDoler;
  bool favoriteProduct;

  EahduhOrderDataModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.image,
    required this.count,
    required this.unitAr,
    required this.unitEn,
    required this.priceLera,
    required this.priceDoler,
    required this.favoriteProduct,
  });
}
