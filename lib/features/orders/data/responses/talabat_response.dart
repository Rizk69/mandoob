import 'package:json_annotation/json_annotation.dart';

part 'talabat_response.g.dart';

@JsonSerializable()
class TalabatResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "balance")
  BalanceTalabatResponse? balance;

  @JsonKey(name: "orders")
  List<OrdersTalabatResponse>? orders;

  TalabatResponse({this.status, this.message, this.balance, this.orders});


  factory TalabatResponse.fromJson(Map<String, dynamic> json) => _$TalabatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TalabatResponseToJson(this);

}

@JsonSerializable()
class OrdersTalabatResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "orderNo")
  String? orderNo;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "date")
  String? date;

  @JsonKey(name: "priceDoler")
  int? priceDoler;

  @JsonKey(name: "priceLera")
  int? priceLera;

  OrdersTalabatResponse({
    this.id,
    this.orderNo,
    this.status,
    this.date,
    this.priceDoler,
    this.priceLera,
  });

  factory OrdersTalabatResponse.fromJson(Map<String, dynamic> json) => _$OrdersTalabatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersTalabatResponseToJson(this);
}


@JsonSerializable()
class BalanceTalabatResponse {
  @JsonKey(name: "totalDoler")
  int? totalDoler;

  @JsonKey(name: "totalLera")
  int? totalLera;

  BalanceTalabatResponse({this.totalDoler, this.totalLera});

  factory BalanceTalabatResponse.fromJson(Map<String, dynamic> json) => _$BalanceTalabatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceTalabatResponseToJson(this);
}
