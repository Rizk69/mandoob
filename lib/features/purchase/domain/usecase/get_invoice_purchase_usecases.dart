import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/purchase/domain/model/invoice_model.dart';
import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';


class GetInvoicePurchaseUseCase implements BaseUseCase<int, InvoicePurchaseModel> {
  final PurchaseRepository _purchaseRepository;

  GetInvoicePurchaseUseCase(this._purchaseRepository);

  @override
  Future<Either<Failure, InvoicePurchaseModel>> execute(int sellPurchaseId) async {
    return await _purchaseRepository.getInvoicePurchase(sellPurchaseId);
  }
}
