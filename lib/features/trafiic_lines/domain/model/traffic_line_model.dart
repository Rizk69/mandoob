class TrafficModel {
  bool status;
  String message;
  List<TrafficDataModel> data;

  TrafficModel({
    required this.status,
    required this.message,
    required this.data,
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
