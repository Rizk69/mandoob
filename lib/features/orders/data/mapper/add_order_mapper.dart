

import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/orders/data/responses/add_order_response.dart';
import 'package:mandoob/features/orders/domain/model/add_order_model.dart';

import '../../domain/model/talabat_model.dart';
import '../responses/talabat_response.dart';

extension AddOrderResponseMapper on AddOrderResponse? {
  AddOrderModel toDomain() {
    return AddOrderModel(
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
      order_id: this?.order_id?.orZero() ?? Constants.zero,
    );
  }
}

extension OrderResponseMapper on OrderResponse? {
  AddOrderModel toDomain() {
    return AddOrderModel(
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
      order_id: 0,
    );
  }
}

