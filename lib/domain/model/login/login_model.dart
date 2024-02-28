class LoginModel {
  int id;
  String name;
  String deliveryNo;
  String email;
  String phone;
  String apiTaken;
  int userId;
  String createdAt;
  String updatedAt;
  Token token;

  LoginModel({
    required this.id,
    required this.name,
    required this.deliveryNo,
    required this.email,
    required this.phone,
    required this.apiTaken,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      name: json['name'],
      deliveryNo: json['delivaryNo'],
      email: json['email'],
      phone: json['phone'],
      apiTaken: json['api_taken'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      token: Token.fromJson(json['token']),
    );
  }
}

class Token {
  String name;
  List<String> abilities;
  dynamic expiresAt;
  int tokenableId;
  String tokenableType;
  String updatedAt;
  String createdAt;
  int id;

  Token({
    required this.name,
    required this.abilities,
    required this.expiresAt,
    required this.tokenableId,
    required this.tokenableType,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      name: json['name'],
      abilities: List<String>.from(json['abilities']),
      expiresAt: json['expires_at'],
      tokenableId: json['tokenable_id'],
      tokenableType: json['tokenable_type'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
