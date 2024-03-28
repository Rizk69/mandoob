import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/model/confirm_model.dart';

import '../model/eahduh_order_model.dart';

abstract class EahduhRepository {
  Future<Either<Failure, EahduhOrderModel>> getEahduhOrder();

  Future<Either<Failure, void>> addEahduhOrder({required int id});

  Future<Either<Failure, void>> deleteEahduhOrder({required int id});

  Future<Either<Failure, CartModel>> getCart();


  Future<Either<Failure, void>> addProductToCart({required int productId});
  Future<Either<Failure, void>> deleteOneProductInCart({required int productId});
  Future<Either<Failure, void>> deleteAllProductInCart();


  Future<Either<Failure, void>> addCurrencyAndCount({required int product_id ,required  int currency_id ,required  num count});
  Future<Either<Failure, ConfirmModel>> confirmInvoice({required ConfirmRequest confirmRequest});

  Future<Either<Failure, void>> payPartialDept(
      {required PayPartialDeptRequest partialDeptRequest});

}
