import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/repository/notification_repository.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/message_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';

class AddPurchaseUseCase
    implements BaseUseCase<AddPurchaseRequest, MessageModel> {
  final PurchaseRepository _purchaseRepository;

  AddPurchaseUseCase(this._purchaseRepository);

  @override
  Future<Either<Failure, MessageModel>> execute(
      AddPurchaseRequest addPurchaseRequest) async {
    return await _purchaseRepository.addPurchase(addPurchaseRequest);
  }
}
