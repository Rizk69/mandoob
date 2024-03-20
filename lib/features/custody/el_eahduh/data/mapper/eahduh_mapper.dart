import 'package:mandoob/app/constants.dart';
import '../../domain/model/eahduh_order_model.dart';
import '../responses/eahduh_response.dart';

extension EahduhResponseMapper on EahduhResponse? {
  EahduhOrderModel toDomain() {
    return EahduhOrderModel(
      status: this?.status ?? false,
      message: this?.message ?? Constants.empty,
      balance: this?.balance?.toDomain() ?? Balance(totalDoler: Constants.zero, totalLera: Constants.zero),
      data: this?.data?.map((product) => product.toDomain()).toList() ?? [],
    );
  }
}

extension BalanceDataMapper on BalanceData? {
  Balance toDomain() {
    return Balance(
      totalDoler: this?.totalDoler?.toInt() ?? Constants.zero,
      totalLera: this?.totalLera?.toInt() ?? Constants.zero,
    );
  }
}

extension ProductDataListMapper on List<ProductData>? {
  List<Data> toDomain() {
    return this?.map((productData) => productData.toDomain()).toList() ?? [];
  }
}

extension ProductDataMapper on ProductData {
  Data toDomain() {
    return Data(
      id: id ?? Constants.zero,
      count: count ?? Constants.zero,
      favoriteProduct: favoriteProduct ?? false,
      nameAr: nameAr ?? Constants.empty,
      nameEn: nameEn ?? Constants.empty,
      priceDoler: priceDoler?.toInt() ?? Constants.zero,
      priceLera: priceLera?.toInt() ?? Constants.zero,
      unitAr: unitAr ?? Constants.empty,
      unitEn: unitEn ?? Constants.empty,
      image: image ?? Constants.empty,
    );
  }
}
