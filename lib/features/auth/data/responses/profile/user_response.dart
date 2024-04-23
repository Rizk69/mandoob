import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "user")
  UserDataResponse? user;

  UserResponse({this.status, this.message, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserDataResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "colors")
  List<ColorItem>? colors;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "balanceTL")
  String? balanceTL;
  @JsonKey(name: "balanceUsd")
  String? balanceUsd;
  @JsonKey(name: "salse_Lera")
  String? salse_Lera;
  @JsonKey(name: "salse_Doler")
  String? salse_Doler;
  @JsonKey(name: "commissions_Lera")
  String? commissions_Lera;
  @JsonKey(name: "commissions_Doler")
  String? commissions_Doler;

  @JsonKey(name: "companyName")
  String? companyName;

  UserDataResponse({
    this.name,
    this.color,
    this.colors,
    this.email,
    this.phone,
    this.balanceTL,
    this.balanceUsd,
    this.salse_Lera,
    this.salse_Doler,
    this.commissions_Lera,
    this.commissions_Doler,
    this.companyName,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class ColorItem {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "color")
  String? color;

  ColorItem({
    this.id,
    this.color,
  });

  factory ColorItem.fromJson(Map<String, dynamic> json) =>
      _$ColorItemFromJson(json);

  Map<String, dynamic> toJson() => _$ColorItemToJson(this);
}
