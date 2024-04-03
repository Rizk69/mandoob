

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
      totalDoler: this?.totalDoler.orZero() ?? Constants.zero,
      totalLera: this?.totalLera.orZero() ?? Constants.zero,
    );
  }
}

extension OrdersDataMapper on OrdersTalabatResponse? {
  OrdersTalabat toDomain() {
    return OrdersTalabat(
      id: this?.id.orZero() ?? Constants.zero,
      orderNo: this?.orderNo ?? Constants.empty,
      status_ar: this?.status_ar.orEmpty() ?? Constants.empty,
      status_en: this?.status_en.orEmpty() ?? Constants.empty,
      date: this?.date ?? Constants.empty,
      priceDoler: this?.priceDoler.orZero() ?? Constants.zero,
      priceLera:this?.priceLera.orZero().orZero() ?? Constants.zero,
    );
  }
}




