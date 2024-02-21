import 'package:json_annotation/json_annotation.dart';

part 'requests.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "account_email")
  String? email;
  @JsonKey(name: "account_password")
  String? accountPassword;

  LoginRequest({
    this.email,
    this.accountPassword,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "userTypeId")
  int? userTypeId;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "account_email")
  String? accountEmail;
  @JsonKey(name: "account_password")
  String? accountPassword;
  @JsonKey(name: "confirmPassword")
  String? confirmPassword;

  RegisterRequest({
    this.id,
    this.userTypeId,
    this.arName,
    this.mobile,
    this.accountEmail,
    this.accountPassword,
    this.confirmPassword,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
