import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/trader/data/mapper/trade_data_mapper.dart';
import 'package:mandoob/features/trader/data/responses/trades_response.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';

extension TradeResponseMapper on TradesResponse? {
  TradeModel toDomain() {
    return TradeModel(
      trades: this?.trades?.map((trade) => trade.toDomain()).toList() ?? [],
      status: this?.status ?? false,
      message: this?.message?.orEmpty() ?? Constants.empty,
    );
  }
}
