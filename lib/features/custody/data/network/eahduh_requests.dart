import 'package:json_annotation/json_annotation.dart';

part 'eahduh_requests.g.dart';

@JsonSerializable()
class AddCurrencyAndCountRequest {

  @JsonKey(name: "product_id")
  int? product_id;

  @JsonKey(name: "currency_id")
  int? currency_id;

  @JsonKey(name: "count")
  num? count;


  AddCurrencyAndCountRequest({
    this.product_id,
    this.currency_id,
    this.count,
  });

  factory AddCurrencyAndCountRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCurrencyAndCountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddCurrencyAndCountRequestToJson(this);
}


@JsonSerializable()
class ConfirmRequest {
  @JsonKey(name: "pay")
  int? pay;


  ConfirmRequest({
    this.pay,
  });

  factory ConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmRequestToJson(this);
}



