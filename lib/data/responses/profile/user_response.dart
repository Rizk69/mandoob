import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "status")
  bool? status;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "user")
  UserDataResponse? userData;

  UserResponse({this.status, this.message, this.userData});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
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
  num? balanceTL;
  @JsonKey(name: "balanceUsd")
  num? balanceUsd;
  @JsonKey(name: "salse_Lera")
  num? salse_Lera;
  @JsonKey(name: "salse_Doler")
  num? salse_Doler;
  @JsonKey(name: "commissions_Lera")
  num? commissions_Lera;
  @JsonKey(name: "commissions_Doler")
  num? commissions_Doler;

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
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
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
