import 'package:json_annotation/json_annotation.dart';

part 'requests.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? accountPassword;

  @JsonKey(name: "deviceToken")
  String? deviceToken;

  LoginRequest({
    this.email,
    this.accountPassword,
    this.deviceToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

