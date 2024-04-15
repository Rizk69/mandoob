import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';


abstract class DebtRepository {

  Future<Either<Failure, DeptTraderModel>> getDebtTrader();

}
