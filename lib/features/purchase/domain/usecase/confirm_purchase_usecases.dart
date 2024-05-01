import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';

import 'package:mandoob/features/purchase/data/network/confirm_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';

import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';

class ConfirmPurchaseUseCase
    implements BaseUseCase<ConfirmPurchaseRequest, AddPurchaseModel> {
  final PurchaseRepository _purchaseRepository;

  ConfirmPurchaseUseCase(this._purchaseRepository);

  @override
  Future<Either<Failure, AddPurchaseModel>> execute(
      ConfirmPurchaseRequest confirmPurchaseRequest) async {
    return await _purchaseRepository.confirmPurchase(confirmPurchaseRequest);
  }
}
