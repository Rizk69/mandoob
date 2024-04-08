import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/expenses/domain/model/expenses_model.dart';
import 'package:mandoob/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesUseCase implements BaseUseCase<void, ExpensesModel> {
  final ExpensesRepository _expensesRepository;

  GetExpensesUseCase(this._expensesRepository);

  @override
  Future<Either<Failure, ExpensesModel>> execute(void input) async {
    return await _expensesRepository.getExpenses();
  }
}

