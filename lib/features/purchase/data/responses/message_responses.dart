import 'package:json_annotation/json_annotation.dart';

part 'message_responses.g.dart';

@JsonSerializable()
class MessageResponses {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;



  MessageResponses({
    this.status,
    this.message,
  });

  factory MessageResponses.fromJson(Map<String, dynamic> json) =>
      _$MessageResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResponsesToJson(this);
}
