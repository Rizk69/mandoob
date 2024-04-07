import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesReasonsUseCase implements BaseUseCase<void, ReasonExpensesModel> {
  final ExpensesRepository _expensesRepository;

  GetExpensesReasonsUseCase(this._expensesRepository);

  @override
  Future<Either<Failure, ReasonExpensesModel>> execute(void input) async {
    return await _expensesRepository.getExpensesReasons();
  }
}
