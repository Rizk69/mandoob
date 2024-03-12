import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';

import '../../../domain/model/user/UserModel.dart';
import '../../responses/profile/user_response.dart';

extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    return UserModel(
      user: this?.userData.toDomain(),
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
    );
  }
}

extension UserDataResponseMapper on UserData? {
  User toDomain() {
    return User(

      name: this?.name?.orEmpty() ?? Constants.empty,
      color: this?.color?.orEmpty() ?? Constants.empty,
      colors: this?.colors?.map((color) => color.toDomain()).toList()??[],
      email: this?.email?.orEmpty() ?? Constants.empty,
      phone: this?.phone?.orEmpty() ?? Constants.empty,
      balanceTL: this?.balanceTL?.orZero() ?? Constants.zero,
      balanceUsd: this?.balanceUsd?.orZero() ?? Constants.zero,
      salseLera: this?.salse_Lera?.orZero() ?? Constants.zero,
      salseDoler: this?.salse_Doler?.orZero() ?? Constants.zero,
      commissionsLera: this?.commissions_Lera?.orZero() ?? Constants.zero,
      commissionsDoler: this?.commissions_Doler?.orZero() ?? Constants.zero,
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