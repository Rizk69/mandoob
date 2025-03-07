import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/custody/data/data_source/eahduh_data_source.dart';
import 'package:mandoob/features/custody/data/mapper/cart_mapper.dart';
import 'package:mandoob/features/custody/data/mapper/confirm_mapper.dart';
import 'package:mandoob/features/custody/data/mapper/eahduh_mapper.dart';
import 'package:mandoob/features/custody/data/mapper/invoices_mapper.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/model/confirm_model.dart';
import 'package:mandoob/features/custody/domain/model/invoices_model.dart';
import 'package:mandoob/features/custody/domain/repository/eahduh_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

import '../../domain/model/eahduh_order_model.dart';

class RepositoryEahduhImpl extends EahduhRepository {
  final RemoteEahduhDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryEahduhImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, EahduhOrderModel>> getEahduhOrder() async {
    final response = await _remoteDataSource.getEahduhOrder();

    try {
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          LocaleKeys.UNAUTHORIZED.tr(),
        ));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> addEahduhOrder({required int id}) async {
    try {
      final response = await _remoteDataSource.addEahduhOrder(id: id);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteEahduhOrder({required int id}) async {
    try {
      final response = await _remoteDataSource.deleteEahduhOrder(id: id);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      final response = await _remoteDataSource.getCart();
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message ?? LocaleKeys.UNAUTHORIZED.tr(),
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> addProductToCart(
      {required int productId}) async {
    try {
      final response =
          await _remoteDataSource.addProductToCart(productId: productId);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteOneProductInCart(
      {required int productId}) async {
    try {
      final response =
          await _remoteDataSource.deleteOneProductInCart(productId: productId);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllProductInCart() async {
    try {
      final response = await _remoteDataSource.deleteAllProductInCart();
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> addCurrencyAndCount(
      {required int product_id,
      required int currency_id,
      required num count}) async {
    final response = await _remoteDataSource.addCurrencyAndCount(
        product_id: product_id, currency_id: currency_id, count: count);
    try {
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, ConfirmModel>> confirmInvoice(
      {required ConfirmRequest confirmRequest}) async {
    try {
      final response = await _remoteDataSource.confirmInvoice(
          confirmRequest: confirmRequest);

      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message.orEmpty(),
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> payPartialDept(
      {required PayPartialDeptRequest partialDeptRequest}) async {

    try {
      final response = await _remoteDataSource.payPartialDept(partialDeptRequest: partialDeptRequest);

      if (response.status == true) {
        print(response.status);
        return Right(response.message);
      } else {
        return Left(Failure(
          ResponseCode.NOT_FOUND,
          response.message.orEmpty(),
        ));
      }

    } catch (error) {
      print("catch");
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, InvoicesModel>> getInvoice({required int invoiceId}) async {
    final response = await _remoteDataSource.getInvoice(invoiceId: invoiceId);

    try {
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message,
        ));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
