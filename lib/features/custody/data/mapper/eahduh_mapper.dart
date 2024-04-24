import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import '../../domain/model/eahduh_order_model.dart';
import '../responses/eahduh_response.dart';

extension EahduhResponseMapper on EahduhResponse? {
  EahduhOrderModel toDomain() {
    return EahduhOrderModel(
      status: this?.status ?? false,
      message: this?.message ?? Constants.empty,
      balance: this?.balance?.toDomain() ?? Balance(totalDoler: Constants.empty, totalLera: Constants.empty),
      data: this?.data?.map((product) => product.toDomain()).toList() ?? [],
    );
  }
}

extension BalanceDataMapper on BalanceData? {
  Balance toDomain() {
    return Balance(
      totalDoler: this?.totalDoler?.orEmpty() ?? Constants.empty,
      totalLera: this?.totalLera?.orEmpty() ?? Constants.empty,
    );
  }
}

extension ProductDataListMapper on List<ProductData>? {
  List<EahduhOrderDataModel> toDomain() {
    return this?.map((productData) => productData.toDomain()).toList() ?? [];
  }
}

extension ProductDataMapper on ProductData {
  EahduhOrderDataModel toDomain() {
    return EahduhOrderDataModel(
      id: id ?? Constants.zero,
      count: count ?? Constants.zero,
      favoriteProduct: favoriteProduct ?? false,
      nameAr: nameAr ?? Constants.empty,
      nameEn: nameEn ?? Constants.empty,
      priceDoler: priceDoler?.orEmpty() ?? Constants.empty,
      priceLera: priceLera?.orEmpty() ?? Constants.empty,
      unitAr: unitAr ?? Constants.empty,
      unitEn: unitEn ?? Constants.empty,
      image: image ?? Constants.empty,
    );
  }
}
