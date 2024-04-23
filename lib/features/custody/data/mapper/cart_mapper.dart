import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import '../../domain/model/cart_model.dart';
import '../responses/cart_response.dart';

extension CartResponseMapper on CartResponse? {
  CartModel toDomain() {
    return CartModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty()??Constants.empty,
      trader: this?.trader?.toDomain(),
      total: this?.total?.toDomain(),
      data: this?.data?.toDomain() ?? [],
    );
  }
}

extension TraderDataMapper on TraderDataResponse? {
  TraderModel toDomain() {
    return TraderModel(
      id: this?.id.orZero()??Constants.zero,
      name: this?.name.orEmpty()??Constants.empty,
    );
  }
}

extension TotalDataMapper on TotalDataResponse? {
  TotalModel toDomain() {
    return TotalModel(
      priceDoler: this?.priceDoler.orEmpty()??Constants.empty,
      priceLera: this?.priceLera.orEmpty()??Constants.empty,
    );
  }
}

extension ProductDataListMapper on List<ProductDataResponse>? {
  List<ProductModel> toDomain() {
    return this?.map((productData) => productData.toDomain()).toList() ?? [];
  }
}

extension ProductDataMapper on ProductDataResponse {
  ProductModel toDomain() {
    return ProductModel(
      id: id.orZero(),
      img: image.orEmpty(),
      nameAr: nameAr.orEmpty(),
      nameEn: nameEn.orEmpty(),
      count: count.orZero(),
      realCountAr: unitAr.orEmpty(),
      realCountEn: unitEn.orEmpty(),
      priceUnitDoler: priceDoler.orEmpty(),
      priceUnitLera: priceLera.orEmpty(),
      quantity: quantity.orZero(),
      tpriceDoler: totalPriceDoler.orEmpty(),
      tpriceLera: totalPriceLera.orEmpty(),
    );
  }
}
