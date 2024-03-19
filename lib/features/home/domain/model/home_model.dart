
class HomeModel {
  bool status;
  String message;
  BalanceDataModel balance;
  List<DeliveryLineDataModel> ? deliveryLine;

  HomeModel({
    required this.status,
    required this.message,
    required this.balance,
    required this.deliveryLine,
  });

}

class BalanceDataModel {

  num totalDoler;
  num totalLera;

  BalanceDataModel({
    required this.totalDoler,
    required this.totalLera,
  });

}


class DeliveryLineDataModel {
  num id;
  String customerName;
  String address;
  String date;
  num active;
  num number;

  DeliveryLineDataModel({
    required this.id,
    required this.customerName,
    required this.address,
    required this.date,
    required this.active,
    required this.number,
  });

}

