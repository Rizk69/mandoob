import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';


abstract class PurchaseRepository {

  Future<Either<Failure, PurchaseModel>> getPurchase();
  Future<Either<Failure, AddPurchaseModel>> addPurchase(AddPurchaseRequest addPurchaseRequest);
  Future<Either<Failure, AddPurchaseModel>> addSalsePurchase(AddSalsePurchaseRequest addSalsePurchaseRequest);

}
