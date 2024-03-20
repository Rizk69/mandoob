class TrafficModel {
  bool status;
  String message;
  CountDataTrafficModel countDataModel;
  List<TrafficDataModel> data;

  TrafficModel({
    required this.status,
    required this.message,
    required this.countDataModel,
    required this.data,
  });

}
class CountDataTrafficModel {

  num active;
  num notActive;

  CountDataTrafficModel({
    required this.active,
    required this.notActive,
  });

}
class TrafficDataModel {
  int id;
  String customerName;
  String address;
  String date;
  int active;
  int number;

  TrafficDataModel({
    required this.id,
    required this.customerName,
    required this.address,
    required this.date,
    required this.active,
    required this.number,
  });

}
