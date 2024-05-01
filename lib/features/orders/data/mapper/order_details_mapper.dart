

import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/orders/data/responses/order_details_response.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';

import '../../domain/model/talabat_model.dart';
import '../responses/talabat_response.dart';

extension OrderDetailsResponseMapper on OrderDetailsResponse? {
  OrderDetailsModel toDomain() {
    return OrderDetailsModel(
      status: this?.status ?? false ,
      message: this?.message.orEmpty() ?? Constants.empty,
      order: this?.order.toDomain(),
      products: this?.products?.map((product) => product.toDomain()).toList() ?? [],
    );
  }
}

extension OrderDataMapper on OrderDetailsDataResponse? {
  Order toDomain() {
    return Order(
      id: this?.id ?? 0,
      orderNo: this?.orderNo.orEmpty() ?? Constants.empty,
      status_ar: this?.status_ar.orEmpty() ?? Constants.empty,
      status_en: this?.status_en.orEmpty() ?? Constants.empty,
      date: this?.date.orEmpty() ?? Constants.empty,
      priceDoler: this?.price_Doler.orEmpty() ?? Constants.empty,
      priceLera: this?.price_Lera.orEmpty() ?? Constants.empty,
    );
  }
}

extension ProductDataMapper on ProductDataResponse? {
  Product toDomain() {
    return Product(
      id: this?.id ?? 0,
      img: this?.img.orEmpty() ?? Constants.empty,
      name_ar: this?.nameAr.orEmpty() ?? Constants.empty,
      name_en: this?.nameEn.orEmpty() ?? Constants.empty,
      count: this?.count?.orZero() ?? Constants.zero, // Assuming `count` is String in Response and needs to be converted to int
      unit_ar: this?.unit_ar.orEmpty() ?? Constants.empty,
      unit_en: this?.unit_en.orEmpty() ?? Constants.empty,
    );
  }
}