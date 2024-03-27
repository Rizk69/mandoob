import 'package:json_annotation/json_annotation.dart';

part 'confirm_response.g.dart';

@JsonSerializable()
class ConfirmResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "invoice_id")
  num? invoiceId;

  @JsonKey(name: "price_Doler")
  num? priceDoler;

  @JsonKey(name: "price_Lera")
  num? priceLera;

  ConfirmResponse({
    required this.status,
    required this.message,
    required this.invoiceId,
    required this.priceDoler,
    required this.priceLera,
  });

  factory ConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmResponseToJson(this);
}
