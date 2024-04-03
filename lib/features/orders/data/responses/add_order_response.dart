import 'package:json_annotation/json_annotation.dart';

part 'add_order_response.g.dart';

@JsonSerializable()
class AddOrderResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "order_id")
  int? order_id;


  AddOrderResponse({this.status, this.message, this.order_id});


  factory AddOrderResponse.fromJson(Map<String, dynamic> json) => _$AddOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderResponseToJson(this);

}



@JsonSerializable()
class OrderResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;



  OrderResponse({this.status, this.message});


  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

}

