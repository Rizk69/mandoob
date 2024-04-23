class UserModel {
  bool status;
  String message;
  UserDataModel? user;

  UserModel({required this.status, required this.message, required this.user});
}



class UserDataModel {
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
  String companyName;

  UserDataModel(
      {required this.name,
      required this.color,
      required this.colors,
      required this.email,
      required this.phone,
      required this.balanceTL,
      required this.balanceUsd,
      required this.salseLera,
      required this.salseDoler,
      required this.companyName,
      required this.commissionsLera,
      required this.commissionsDoler});
}



class ColorsModel {
  int id;
  String color;

  ColorsModel({required this.id, required this.color});
}
