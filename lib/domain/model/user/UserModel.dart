/// status : true
/// message : "تم اظهار الداتا"
/// user : {"name":"delivary","color":"#969fee","colors":[{"id":1,"color":"#969fee"},{"id":2,"color":"#f8ba80"},{"id":3,"color":"#b86e9f"},{"id":4,"color":"#91c89a"}],"email":"delivary@gmail.com","phone":"011015","balanceTL":0,"balanceUsd":0,"salse_Lera":0,"salse_Doler":0,"commissions_Lera":0,"commissions_Doler":0}

class UserModel {
  bool status;
  String message;
  User? user;

  UserModel({required this.status, required this.message, required this.user});
}

/// name : "delivary"
/// color : "#969fee"
/// colors : [{"id":1,"color":"#969fee"},{"id":2,"color":"#f8ba80"},{"id":3,"color":"#b86e9f"},{"id":4,"color":"#91c89a"}]
/// email : "delivary@gmail.com"
/// phone : "011015"
/// balanceTL : 0
/// balanceUsd : 0
/// salse_Lera : 0
/// salse_Doler : 0
/// commissions_Lera : 0
/// commissions_Doler : 0

class User {
  String name;
  String color;
  List<ColorsModel>? colors;
  String email;
  String phone;
  num balanceTL;
  num balanceUsd;
  num salseLera;
  num salseDoler;
  num commissionsLera;
  num commissionsDoler;

  User(
      {required this.name,
      required this.color,
      required this.colors,
      required this.email,
      required this.phone,
      required this.balanceTL,
      required this.balanceUsd,
      required this.salseLera,
      required this.salseDoler,
      required this.commissionsLera,
      required this.commissionsDoler});
}

/// id : 1
/// color : "#969fee"

class ColorsModel {
  int id;
  String color;

  ColorsModel({required this.id, required this.color});
}
