import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/repository/notification_repository.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';

class AddSalsePurchaseUseCase
    implements BaseUseCase<AddSalsePurchaseRequest, AddPurchaseModel> {
  final PurchaseRepository _purchaseRepository;

  AddSalsePurchaseUseCase(this._purchaseRepository);

  @override
  Future<Either<Failure, AddPurchaseModel>> execute(
      AddSalsePurchaseRequest addSalsePurchaseRequest) async {
    return await _purchaseRepository.addSalsePurchase(addSalsePurchaseRequest);
  }
}
