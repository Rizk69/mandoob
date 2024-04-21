import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/debts/domain/model/debt_invoice_trader_model.dart';
import 'package:mandoob/features/debts/domain/repository/debt_repository.dart';

class GetDebtInvoiceTraderUseCase
    implements BaseUseCase<int, DebtInvoiceTraderModel> {
  final DebtRepository _debtRepository;

  GetDebtInvoiceTraderUseCase(this._debtRepository);

  @override
  Future<Either<Failure, DebtInvoiceTraderModel>> execute(int invoiceId) async {
    return await _debtRepository.getDebtInvoiceTrade(invoiceId);
  }
}
