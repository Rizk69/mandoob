import 'package:mandoob/features/debts/data/network/debt_api.dart';
import 'package:mandoob/features/debts/data/responses/debt_trader_response.dart';

abstract class RemoteDebtDataSource {
  Future<DebtTraderResponse> getDebtTrader();


}

class RemoteDebtDataSourceImpl extends RemoteDebtDataSource {
  final DebtServiceClient _appServiceClient;

  RemoteDebtDataSourceImpl(this._appServiceClient);

  @override
  Future<DebtTraderResponse> getDebtTrader() {
    return _appServiceClient.getDebtTrader();
  }

}
