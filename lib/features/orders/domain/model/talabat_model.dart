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

  OrdersTalabat(
      {required this.id,
      required this.orderNo,
      required this.status,
      required this.date});
}

class BalanceTalabat {
  int totalDoler;
  int totalLera;

  BalanceTalabat({required this.totalDoler, required this.totalLera});
}
