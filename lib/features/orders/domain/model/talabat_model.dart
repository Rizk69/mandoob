class TalabatModel {
  bool status;
  String message;
  BalanceTalabat balance;
  List<OrdersTalabat> orders;

  TalabatModel(
      {required this.status,
      required this.message,
      required this.balance,
      required this.orders});
}

class OrdersTalabat {
  int id;
  String orderNo;
  String date;
  int priceDoler;
  String status_ar;
  String status_en;
  int priceLera;

  OrdersTalabat(
      {required this.id,
      required this.orderNo,
      required this.date,
      required this.priceDoler,
      required this.status_ar,
      required this.status_en,
      required this.priceLera,});
}

class BalanceTalabat {
  int totalDoler;
  int totalLera;

  BalanceTalabat({required this.totalDoler, required this.totalLera});
}
