import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/auth/domain/model/profile/user_model.dart';
import '../../responses/profile/user_response.dart';

extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    return UserModel(
      user: this?.user.toDomain(),
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
    );
  }
}

extension UserDataResponseMapper on UserDataResponse? {
  UserDataModel toDomain() {
    return UserDataModel(

      name: this?.name?.orEmpty() ?? Constants.empty,
      color: this?.color?.orEmpty() ?? Constants.empty,
      colors: this?.colors?.map((color) => color.toDomain()).toList()??[],
      email: this?.email?.orEmpty() ?? Constants.empty,
      phone: this?.phone?.orEmpty() ?? Constants.empty,
      balanceTL: this?.balanceTL?.orEmpty() ?? Constants.empty,
      balanceUsd: this?.balanceUsd?.orEmpty() ?? Constants.empty,
      salseLera: this?.salse_Lera?.orEmpty() ?? Constants.empty,
      salseDoler: this?.salse_Doler?.orEmpty() ?? Constants.empty,
      commissionsLera: this?.commissions_Lera?.orEmpty() ?? Constants.empty,
      commissionsDoler: this?.commissions_Doler?.orEmpty() ?? Constants.empty,
      companyName: this?.companyName?.orEmpty() ?? Constants.empty,
    );
  }
}
extension ColorResponseMapper on ColorItem? {
  ColorsModel toDomain() {
    return ColorsModel(
      color:this?.color?.orEmpty() ?? Constants.empty,
        id: this?.id?.orZero() ?? Constants.zero,

    );
  }
}