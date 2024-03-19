import 'package:mandoob/features/trader/data/network/trade_api.dart';
import 'package:mandoob/features/trader/data/network/trade_requests.dart';
import 'package:mandoob/features/trader/data/responses/trades_response.dart';

abstract class RemoteTradeDataSource {
  Future<TradesResponse> getTrades();
  Future<TradesResponse> addTrade(TradeRequest tradeRequest);
}

class RemoteTradeDataSourceImpl extends RemoteTradeDataSource {
  final TradeServiceClient _tradeServiceClient;

  RemoteTradeDataSourceImpl(this._tradeServiceClient);

  @override
  Future<TradesResponse> getTrades() {
    return _tradeServiceClient.getTrades();
  }

  @override
  Future<TradesResponse> addTrade(TradeRequest tradeRequest) {
    return _tradeServiceClient.addTrade(tradeRequest);
  }
}
