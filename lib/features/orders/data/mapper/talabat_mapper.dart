

import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';

import '../../domain/model/talabat_model.dart';
import '../responses/talabat_response.dart';

extension TalabatResponseMapper on TalabatResponse? {
  TalabatModel toDomain() {
    return TalabatModel(
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
      balance: this?.balance?.toDomain() ?? BalanceTalabat(totalDoler: 0, totalLera: 0),
      orders: this?.orders?.map((order) => order.toDomain()).toList() ?? [],
    );
  }
}

extension BalanceDataMapper on BalanceTalabatResponse? {
  BalanceTalabat toDomain() {
    return BalanceTalabat(
      totalDoler: this?.totalDoler ?? Constants.zero,
      totalLera: this?.totalLera ?? Constants.zero,
    );
  }
}

extension OrdersDataMapper on OrdersTalabatResponse? {
  OrdersTalabat toDomain() {
    return OrdersTalabat(
      // Map properties from OrdersDataResponse to OrdersDataModel
      // Example:
      id: this?.id ?? Constants.zero,
      orderNo: this?.orderNo ?? Constants.empty,
      status: this?.status ?? Constants.zero,
      date: this?.date ?? Constants.empty,
    );
  }
}
