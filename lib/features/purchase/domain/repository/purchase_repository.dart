import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/confirm_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/pay_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/invoice_model.dart';
import 'package:mandoob/features/purchase/domain/model/message_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';

abstract class PurchaseRepository {
  Future<Either<Failure, PurchaseModel>> getPurchase();
  Future<Either<Failure, InvoicePurchaseModel>> getInvoicePurchase(int sellPurchaseId);
  Future<Either<Failure, MessageModel>> addPurchase(
      AddPurchaseRequest addPurchaseRequest);
  Future<Either<Failure, AddPurchaseModel>> addSalsePurchase(
      AddSalsePurchaseRequest addSalsePurchaseRequest);
  Future<Either<Failure, AddPurchaseModel>> confirmPurchase(
      ConfirmPurchaseRequest confirmPurchaseRequest);
  Future<Either<Failure, MessageModel>> payPurchase(
      PayPurchaseRequest payPurchaseRequest);
}
