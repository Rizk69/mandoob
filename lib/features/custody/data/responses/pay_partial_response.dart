import 'package:json_annotation/json_annotation.dart';

part 'pay_partial_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PayPartialResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;


  PayPartialResponse({
    this.status,
    this.message,
  });

  factory PayPartialResponse.fromJson(Map<String, dynamic> json) =>
      _$PayPartialResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PayPartialResponseToJson(this);
}
