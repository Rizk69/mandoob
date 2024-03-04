class LoginModel {
  bool status;
  String token;
  String message;

  LoginModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      token: json['token'],
      message: json['message'],
    );
  }
}

