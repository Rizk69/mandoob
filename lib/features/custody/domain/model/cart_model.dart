class CartModel {
  bool status;
  String message;
  TraderModel? trader;
  TotalModel? total;
  List<ProductModel> data;

  CartModel({
    required this.status,
    required this.message,
    required this.trader,
    required this.total,
     required this.data,
  });
}

class TraderModel {
  int id;
  String name;

  TraderModel({required this.id, required this.name});
}

class TotalModel {
  num priceDoler;
  num priceLera;

  TotalModel({required this.priceDoler, required this.priceLera});
}

class ProductModel {
  int id;
  String img; // Using 'img' to match your data structure
  String nameAr;
  String nameEn;
  int count;
  String realCountAr;
  String realCountEn;
  num priceUnitDoler;
  num priceUnitLera;
  int quantity;
  num tpriceDoler;
  num tpriceLera;

  ProductModel({
    required this.id,
    required this.img,
    required this.nameAr,
    required this.nameEn,
    required this.count,
    required this.realCountAr,
    required this.realCountEn,
    required this.priceUnitDoler,
    required this.priceUnitLera,
    required this.quantity,
    required this.tpriceDoler,
    required this.tpriceLera,
  });
}
