import 'package:mandoob/features/debts/data/network/debt_api.dart';
import 'package:mandoob/features/debts/data/network/pay_dept_trader_request.dart';
import 'package:mandoob/features/debts/data/responses/debt_delegate_response.dart';
import 'package:mandoob/features/debts/data/responses/debt_invoice_trader_response.dart';
import 'package:mandoob/features/debts/data/responses/debt_trader_response.dart';
import 'package:mandoob/features/debts/data/responses/pay_debt_trader_response.dart';

abstract class RemoteDebtDataSource {
  Future<DebtTraderResponse> getDebtTrader();
  Future<DebtDelegateResponse> getDebtDelegate();
  Future<DebtInvoiceTraderResponse> getDebtInvoiceTrade(int invoiceId);
  Future<PayDebtTraderResponse> payDebtTrader(PayDeptTraderRequest payDeptTraderRequest);


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

  @override
  Future<DebtInvoiceTraderResponse> getDebtInvoiceTrade(int invoiceId) {
    return _appServiceClient.getDebtInvoiceTrade(invoiceId);

  }

  @override
  Future<PayDebtTraderResponse> payDebtTrader(PayDeptTraderRequest payDeptTraderRequest) {
    return _appServiceClient.payDebtTrader(payDeptTraderRequest);

  }



}
