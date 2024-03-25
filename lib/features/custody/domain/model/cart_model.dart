class CartModel {
  bool? status;
  String? message;
  TraderModel? trader;
  TotalModel? total;
  List<ProductModel>? data;

  CartModel({
    this.status,
    this.message,
    this.trader,
    this.total,
    required this.data,
  });
}

class TraderModel {
  int? id;
  String? name;

  TraderModel({this.id, this.name});
}

class TotalModel {
  num? priceDoler;
  num? priceLera;

  TotalModel({this.priceDoler, this.priceLera});
}

class ProductModel {
  int? id;
  String? img; // Using 'img' to match your data structure
  String? nameAr;
  String? nameEn;
  int? count;
  String? realCountAr;
  String? realCountEn;
  num? priceUnitDoler;
  num? priceUnitLera;
  int? quantity;
  num? tpriceDoler;
  num? tpriceLera;

  ProductModel({
    this.id,
    this.img,
    this.nameAr,
    this.nameEn,
    this.count,
    this.realCountAr,
    this.realCountEn,
    this.priceUnitDoler,
    this.priceUnitLera,
    this.quantity,
    this.tpriceDoler,
    this.tpriceLera,
  });
}
