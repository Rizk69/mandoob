class TradeDataModel {
  int id;
  String img;
  String customerName;
  String phone;
  String priceAr;
  String priceEn;
  String address;
  bool selectCustomer;

  TradeDataModel({
    required this.id,
    required this.img,
    required this.customerName,
    required this.phone,
    required this.priceAr,
    required this.priceEn,
    required this.address,
    required this.selectCustomer,
  });
}
