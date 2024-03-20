class EahduhOrderModel {
  bool status;
  String message;
  Balance balance;
  List<Data> data;

  EahduhOrderModel({
    required this.status,
    required this.message,
    required this.balance,
    required this.data,
  });

  factory EahduhOrderModel.fromJson(Map<String, dynamic> json) {
    return EahduhOrderModel(
      status: json['status'] ,
      message: json['message'] ,
      balance: Balance.fromJson(json['balance'] ?? {}),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'balance': balance.toJson(),
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Balance {
  int totalDoler;
  int totalLera;

  Balance({
    required this.totalDoler,
    required this.totalLera,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      totalDoler: json['total_Doler'],
      totalLera: json['total_Lera'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_Doler': totalDoler,
      'total_Lera': totalLera,
    };
  }
}

class Data {
  int id;
  String nameAr;
  String nameEn;
  dynamic image;
  int count;
  String unitAr;
  String unitEn;
  int priceLera;
  int priceDoler;
  bool favoriteProduct;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ,
      nameAr: json['name_ar'],
      nameEn: json['name_en'] ,
      image: json['image'],
      count: json['count'] ,
      unitAr: json['unit_ar'] ,
      unitEn: json['unit_en'] ,
      priceLera: json['price_Lera'] ,
      priceDoler: json['price_Doler'] ,
      favoriteProduct: json['favorite_product'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'image': image,
      'count': count,
      'unit_ar': unitAr,
      'unit_en': unitEn,
      'price_Lera': priceLera,
      'price_Doler': priceDoler,
      'favorite_product': favoriteProduct,
    };
  }
}
