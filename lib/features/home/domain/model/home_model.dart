
class HomeModel {
  bool status;
  String message;
  BalanceDataModel balance;
  CountDataModel countDataModel;
  List<DeliveryLineDataModel> ? deliveryLine;

  HomeModel({
    required this.status,
    required this.message,
    required this.balance,
    required this.countDataModel,
    required this.deliveryLine,
  });

}

class BalanceDataModel {

  String totalDoler;
  String totalLera;

  BalanceDataModel({
    required this.totalDoler,
    required this.totalLera,
  });

}
class CountDataModel {

  num active;
  num notActive;

  CountDataModel({
    required this.active,
    required this.notActive,
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

