import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/trader/data/responses/trades_response.dart';
import 'package:mandoob/features/trader/domain/model/trades_data_model.dart';

extension TradeDataResponseMapper on TradesDataResponse? {
  TradeDataModel toDomain() {
    return TradeDataModel(
      id: this?.id?.orZero() ?? Constants.zero,
      customerName: this?.customer_name?.orEmpty() ?? Constants.empty,
      img: this?.img?.orEmpty() ?? Constants.empty,
      phone: this?.phone?.orEmpty() ?? Constants.empty,
      selectCustomer: this?.selectCustomer?? false,
    );
  }
}
