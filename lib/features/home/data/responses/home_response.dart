import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "color")
  String? color;

  @JsonKey(name: "balance")
  BalanceDataResponse? balance;
  @JsonKey(name: "count")
  CountDataResponse? countDataResponse;

  @JsonKey(name: "delivary_Line")
  List<DeliveryLineDataResponse>? deliveryLine;

  HomeResponse({
    this.status,
    this.message,
    this.color,
    this.balance,
    this.deliveryLine,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class BalanceDataResponse {
  @JsonKey(name: "total_Doler")
  String? totalDoler;

  @JsonKey(name: "total_Lera")
  String? totalLera;

  BalanceDataResponse({
    this.totalDoler,
    this.totalLera,
  });

  factory BalanceDataResponse.fromJson(Map<String, dynamic> json) => _$BalanceDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceDataResponseToJson(this);
}

@JsonSerializable()
class CountDataResponse {
  @JsonKey(name: "active_1")
  num? active;

  @JsonKey(name: "active_0")
  num? notActive;

  CountDataResponse({
    this.active,
    this.notActive,
  });

  factory CountDataResponse.fromJson(Map<String, dynamic> json) => _$CountDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountDataResponseToJson(this);
}

@JsonSerializable()
class DeliveryLineDataResponse {
  @JsonKey(name: "id")
  num? id;

  @JsonKey(name: "customer_name")
  String? customerName;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "active")
  num? active;

  @JsonKey(name: "number")
  num? number;

  DeliveryLineDataResponse({
    this.id,
    this.customerName,
    this.address,
    this.date,
    this.active,
    this.number,
  });

  factory DeliveryLineDataResponse.fromJson(Map<String, dynamic> json) => _$DeliveryLineDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryLineDataResponseToJson(this);
}

