import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/model/invoices_model.dart';
import '../repository/eahduh_repository.dart';

class GetInvoicesUseCase implements BaseUseCase<int, InvoicesModel> {
  final EahduhRepository _eahduhRepository;

  GetInvoicesUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, InvoicesModel>> execute(int invoiceId) async {
    return await _eahduhRepository.getInvoice(invoiceId: invoiceId);
  }
}
