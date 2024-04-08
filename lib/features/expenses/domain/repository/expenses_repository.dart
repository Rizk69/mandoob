import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/expenses/data/responses/addExpenses_requests.dart';
import 'package:mandoob/features/expenses/domain/model/expenses_model.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';

abstract class ExpensesRepository {
  Future<Either<Failure, ReasonExpensesModel>> getExpensesReasons();
  Future<Either<Failure, ExpensesModel>> getExpenses();
  Future<Either<Failure, ReasonExpensesModel>> addExpensesReasons(AddExpensesRequests addExpensesRequests);

}
