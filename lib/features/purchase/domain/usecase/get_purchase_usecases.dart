import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/repository/notification_repository.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';

class GetPurchaseUseCase implements BaseUseCase<void, PurchaseModel> {
  final PurchaseRepository _purchaseRepository;

  GetPurchaseUseCase(this._purchaseRepository);

  @override
  Future<Either<Failure, PurchaseModel>> execute(void input) async {
    return await _purchaseRepository.getPurchase();
  }
}
