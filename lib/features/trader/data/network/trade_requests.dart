import 'package:json_annotation/json_annotation.dart';

part 'trade_requests.g.dart';

@JsonSerializable()
class TradeRequest {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "price")
  int? price;



  TradeRequest({
    this.name,
    this.address,
    this.phone,
    this.price,
  });

  factory TradeRequest.fromJson(Map<String, dynamic> json) =>
      _$TradeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TradeRequestToJson(this);
}
