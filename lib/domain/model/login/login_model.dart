class LoginModel {
  int returnValue;
  String returnString;
  int yearId;
  int studentId;
  int userId;
  String userArName;
  String userPicture;
  int userTypeId;
  String userTypeArName;
  AuthTokenModel? authToken;

  LoginModel(
    this.returnValue,
    this.returnString,
    this.yearId,
    this.studentId,
    this.userId,
    this.userArName,
    this.userPicture,
    this.userTypeId,
    this.userTypeArName,
    this.authToken,
  );
}

class AuthTokenModel {
  List<int> eduCompList;
  String token;
  int returnValue;
  int roleId;
  int typeId;

  AuthTokenModel(
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  );
}
