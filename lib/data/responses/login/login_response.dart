import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "data")
  Data? data;

  LoginResponse({
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  @JsonKey(name: "delivaryNo")
  String? deliveryNo;
  String? email;
  String? phone;
  @JsonKey(name: "api_taken")
  String? apiTaken;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  Token? token;

  Data({
    this.id,
    this.name,
    this.deliveryNo,
    this.email,
    this.phone,
    this.apiTaken,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Token {
  String? name;
  List<String>? abilities;
  @JsonKey(name: "expires_at")
  String? expiresAt;
  @JsonKey(name: "tokenable_id")
  int? tokenableId;
  @JsonKey(name: "tokenable_type")
  String? tokenableType;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  Token({
    this.name,
    this.abilities,
    this.expiresAt,
    this.tokenableId,
    this.tokenableType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
