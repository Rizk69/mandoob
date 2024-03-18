import 'package:mandoob/features/auth/data/network/auth_api.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/data/responses/login/login_response.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';
import 'package:mandoob/features/trader/data/network/trade_api.dart';
import 'package:mandoob/features/trader/data/responses/trades_response.dart';

abstract class RemoteTradeDataSource {
  Future<TradesResponse> getTrades();
}

class RemoteTradeDataSourceImpl extends RemoteTradeDataSource {
  final TradeServiceClient _tradeServiceClient;

  RemoteTradeDataSourceImpl(this._tradeServiceClient);

  @override
  Future<TradesResponse> getTrades() {
    return _tradeServiceClient.getTrades();
  }
}
