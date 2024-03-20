import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/home/data/responses/home_response.dart';
import 'package:mandoob/features/home/domain/model/home_model.dart';

extension HomeResponseMapper on HomeResponse? {
  HomeModel toDomain() {
    return HomeModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      balance: this!.balance.toDomain(),
      deliveryLine:
          this?.deliveryLine?.map((line) => line.toDomain()).toList() ?? [],
      countDataModel: this!.countDataResponse.toDomain(),
    );
  }
}

extension BalanceDataMapper on BalanceDataResponse? {
  BalanceDataModel toDomain() {
    return BalanceDataModel(
      totalDoler: this?.totalDoler ?? Constants.zero,
      totalLera: this?.totalLera ?? Constants.zero,
    );
  }
}

extension CountDataMapper on CountDataResponse? {
  CountDataModel toDomain() {
    return CountDataModel(
      active: this?.active ?? Constants.zero,
      notActive: this?.notActive ?? Constants.zero,
    );
  }
}

extension DeliveryLineDataMapper on DeliveryLineDataResponse? {
  DeliveryLineDataModel toDomain() {
    return DeliveryLineDataModel(
      id: this?.id ?? Constants.zero,
      customerName: this?.customerName.orEmpty() ?? Constants.empty,
      address: this?.address.orEmpty() ?? Constants.empty,
      date: this?.date.orEmpty() ?? Constants.empty,
      active: this?.active ?? Constants.zero,
      number: this?.number ?? Constants.zero,
    );
  }
}
