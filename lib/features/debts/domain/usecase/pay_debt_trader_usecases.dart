import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/data/network/pay_dept_trader_request.dart';
import 'package:mandoob/features/debts/domain/model/pay_debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/repository/debt_repository.dart';

class PayDebtTraderUseCase
    implements BaseUseCase<PayDeptTraderRequest, PayDebtTraderModel> {
  final DebtRepository _debtRepository;

  PayDebtTraderUseCase(this._debtRepository);

  @override
  Future<Either<Failure, PayDebtTraderModel>> execute(
      PayDeptTraderRequest payDeptTraderRequest) async {
    return await _debtRepository.payDebtTrader(payDeptTraderRequest);
  }
}
