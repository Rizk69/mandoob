import 'package:mandoob/features/debts/data/network/debt_api.dart';
import 'package:mandoob/features/debts/data/responses/debt_delegate_response.dart';
import 'package:mandoob/features/debts/data/responses/debt_trader_response.dart';

abstract class RemoteDebtDataSource {
  Future<DebtTraderResponse> getDebtTrader();
  Future<DebtDelegateResponse> getDebtDelegate();


}

class RemoteDebtDataSourceImpl extends RemoteDebtDataSource {
  final DebtServiceClient _appServiceClient;

  RemoteDebtDataSourceImpl(this._appServiceClient);

  @override
  Future<DebtTraderResponse> getDebtTrader() {
    return _appServiceClient.getDebtTrader();
  }

  @override
  Future<DebtDelegateResponse> getDebtDelegate() {
    return _appServiceClient.getDebtDelegate();
  }

}
