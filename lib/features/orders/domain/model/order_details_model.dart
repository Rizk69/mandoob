class OrderDetailsModel {
  bool status;
  String message;
  Order? order;
  List<Product>? products;

  OrderDetailsModel({
    required this.status,
    required this.message,
    required this.order,
    required this.products,
  });
}

class Order {
  int id;
  String orderNo;
  String status_ar;
  String status_en;
  String date;
  num priceDoler;
  num priceLera;

  Order({
    required this.id,
    required this.orderNo,
    required this.status_ar,
    required this.status_en,
    required this.date,
    required this.priceDoler,
    required this.priceLera,
  });
}

class Product {
  int id;
  String img;
  String name_ar;
  String name_en;
  num count;
  String unit_ar;
  String unit_en;

  Product({
    required this.id,
    required this.img,
    required this.name_ar,
    required this.name_en,
    required this.count,
    required this.unit_ar,
    required this.unit_en,
  });
}
