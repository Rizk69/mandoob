import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/repository/debt_repository.dart';

class GetTraderDebtsUseCase
    implements BaseUseCase<void, DeptTraderModel> {
  final DebtRepository _debtRepository;

  GetTraderDebtsUseCase(this._debtRepository);

  @override
  Future<Either<Failure, DeptTraderModel>> execute(void input) async {
    return await _debtRepository.getDebtTrader();
  }
}
