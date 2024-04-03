import 'package:json_annotation/json_annotation.dart';

part 'order_requests.g.dart';

@JsonSerializable()
class AddOrderRequest {
  @JsonKey(name: "product_id")
  String? product_id;

  @JsonKey(name: "type")
  String? type;


  @JsonKey(name: "count")
  String? count;


  @JsonKey(name: "unit_id")
  String? unit_id;


  @JsonKey(name: "unit_category_id")
  String? unit_category_id;


  @JsonKey(name: "unit_sub_categories_id")
  String? unit_sub_categories_id;



  AddOrderRequest({
    this.product_id,
    this.type,
    this.count,
    this.unit_id,
    this.unit_category_id,
    this.unit_sub_categories_id,
  });

  factory AddOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$AddOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrderRequestToJson(this);
}


@JsonSerializable()
class OrderRequest {

  @JsonKey(name: "order_id")
  String? order_id;

  @JsonKey(name: "product_id")
  String? product_id;


  OrderRequest({
    this.order_id,
    this.product_id,

  });

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
