import 'package:json_annotation/json_annotation.dart';

part 'traffic_line_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TrafficResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<TrafficDataResponse>? data;

  TrafficResponse({
    this.status,
    this.message,
    this.data,
  });

  factory TrafficResponse.fromJson(Map<String, dynamic> json) => _$TrafficResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrafficResponseToJson(this);
}


@JsonSerializable()
class TrafficDataResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "customer_name")
  String? customerName;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "active")
  int? active;

  @JsonKey(name: "number")
  int? number;

  TrafficDataResponse({
    this.id,
    this.customerName,
    this.address,
    this.date,
    this.active,
    this.number,
  });

  factory TrafficDataResponse.fromJson(Map<String, dynamic> json) => _$TrafficDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrafficDataResponseToJson(this);
}