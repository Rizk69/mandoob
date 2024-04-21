import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/domain/model/debt_delegate_model.dart';
import 'package:mandoob/features/debts/domain/repository/debt_repository.dart';

class GetDelegateDebtsUseCase
    implements BaseUseCase<void, DebtDelegateModel> {
  final DebtRepository _debtRepository;

  GetDelegateDebtsUseCase(this._debtRepository);

  @override
  Future<Either<Failure, DebtDelegateModel>> execute(void input) async {
    return await _debtRepository.getDebtDelegate();
  }
}
