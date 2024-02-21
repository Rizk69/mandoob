import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "user_ar_name")
  String? userArName;
  @JsonKey(name: "user_picture")
  String? userPicture;
  @JsonKey(name: "user_type_id")
  int? userTypeId;
  @JsonKey(name: "user_type_ar_name")
  String? userTypeArName;
  @JsonKey(name: "token")
  TokenResponse? token;

  RegisterResponse({
    this.returnValue,
    this.returnString,
    this.userId,
    this.userArName,
    this.userPicture,
    this.userTypeId,
    this.userTypeArName,
    this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class TokenResponse {
  @JsonKey(name: "funcs")
  int? funcs;
  @JsonKey(name: "EduCompList")
  List<int>? eduCompList;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "role_Id")
  int? roleId;
  @JsonKey(name: "type_Id")
  int? typeId;

  TokenResponse({
    this.funcs,
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}


