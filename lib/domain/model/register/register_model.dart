class RegisterModel {
  int returnValue;
  String returnString;
  int userId;
  String userArName;
  String userPicture;
  int userTypeId;
  String userTypeArName;
  TokenModel? token;

  RegisterModel(
    this.returnValue,
    this.returnString,
    this.userId,
    this.userArName,
    this.userPicture,
    this.userTypeId,
    this.userTypeArName,
    this.token,
  );
}

class TokenModel {
  int funcs;
  List<int> eduCompList;
  String token;
  int returnValue;
  int roleId;
  int typeId;

  TokenModel(
    this.funcs,
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  );
}
