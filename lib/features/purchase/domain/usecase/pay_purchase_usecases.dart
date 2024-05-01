import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/repository/notification_repository.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/pay_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/message_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';

class PayPurchaseUseCase
    implements BaseUseCase<PayPurchaseRequest, MessageModel> {
  final PurchaseRepository _purchaseRepository;

  PayPurchaseUseCase(this._purchaseRepository);

  @override
  Future<Either<Failure, MessageModel>> execute(
      PayPurchaseRequest payPurchaseRequest) async {
    return await _purchaseRepository.payPurchase(payPurchaseRequest);
  }
}
