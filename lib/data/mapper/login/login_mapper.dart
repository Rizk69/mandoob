import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/data/responses/login/login_response.dart';
import 'package:mandoob/domain/model/login/login_model.dart';

extension AuthTokenResponseMapper on AuthToken? {
  AuthTokenModel toDomain() {
    return AuthTokenModel(
      this!.eduCompList!.map((eduCompId) => eduCompId).cast<int>().toList(),
      this?.token.orEmpty() ?? Constants.empty,
      this?.returnValue.orZero() ?? Constants.zero,
      this?.roleId.orZero() ?? Constants.zero,
      this?.typeId.orZero() ?? Constants.zero,
    );
  }
}

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
      this?.yearId.orZero() ?? Constants.zero,
      this?.studentId.orZero() ?? Constants.zero,
      this?.userId.orZero() ?? Constants.zero,
      this?.userArName.orEmpty() ?? Constants.empty,
      this?.userPicture.orEmpty() ?? Constants.empty,
      this?.userTypeId.orZero() ?? Constants.zero,
      this?.userTypeArName.orEmpty() ?? Constants.empty,
      this?.authToken.toDomain(),
    );
  }
}
