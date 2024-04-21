import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/data/network/pay_dept_trader_request.dart';
import 'package:mandoob/features/debts/domain/model/debt_delegate_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_invoice_trader_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/model/pay_debt_trader_model.dart';


abstract class DebtRepository {

  Future<Either<Failure, DeptTraderModel>> getDebtTrader();
  Future<Either<Failure, DebtDelegateModel>> getDebtDelegate();
  Future<Either<Failure, DebtInvoiceTraderModel>> getDebtInvoiceTrade(int invoiceId);
  Future<Either<Failure, PayDebtTraderModel>> payDebtTrader(PayDeptTraderRequest payDeptTraderRequest);

}
