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



@JsonSerializable()
class PayPartialDeptRequest {
  @JsonKey(name: "invoice_id")
  num? invoice_id;

  @JsonKey(name: "pay_Doler")
  num? pay_Doler;

  @JsonKey(name: "pay_Lera")
  num? pay_Lera;


  PayPartialDeptRequest({
    this.invoice_id,
    this.pay_Doler,
    this.pay_Lera,
  });

  factory PayPartialDeptRequest.fromJson(Map<String, dynamic> json) =>
      _$PayPartialDeptRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayPartialDeptRequestToJson(this);
}


