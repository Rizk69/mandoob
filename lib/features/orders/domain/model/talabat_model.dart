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
  int status;
  String date;
  int priceDoler;
  int priceLera;

  OrdersTalabat(
      {required this.id,
      required this.orderNo,
      required this.status,
      required this.date,
      required this.priceDoler,
      required this.priceLera,});
}

class BalanceTalabat {
  int totalDoler;
  int totalLera;

  BalanceTalabat({required this.totalDoler, required this.totalLera});
}
