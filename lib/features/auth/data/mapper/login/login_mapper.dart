import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/auth/data/responses/login/login_response.dart';
import 'package:mandoob/features/auth/domain/model/login/login_model.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      token: this?.token.orEmpty() ?? Constants.empty
    );
  }
}
