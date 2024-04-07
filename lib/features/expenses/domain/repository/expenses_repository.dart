import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';

abstract class ExpensesRepository {
  Future<Either<Failure, ReasonExpensesModel>> getExpensesReasons();

}
