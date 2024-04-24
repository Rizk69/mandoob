import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/purchase/data/data_source/purchase_data_source.dart';
import 'package:mandoob/features/purchase/data/mapper/add_purchase_mapper.dart';
import 'package:mandoob/features/purchase/data/mapper/purchase_mapper.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/domain/repository/purchase_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class PurchaseRepositoryImpl extends PurchaseRepository {
  final RemotePurchaseDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  PurchaseRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, PurchaseModel>> getPurchase() async {
    final response = await _remoteDataSource.getPurchase();

    try {
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        print(response.message);
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message ?? LocaleKeys.ERROR.tr(),
        ));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, AddPurchaseModel>> addPurchase(
      AddPurchaseRequest addPurchaseRequest) async {
    final response = await _remoteDataSource.addPurchase(addPurchaseRequest);

    try {
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        print(response.message);
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message ?? LocaleKeys.ERROR.tr(),
        ));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, AddPurchaseModel>> addSalsePurchase(
      AddSalsePurchaseRequest addSalsePurchaseRequest) async {
    final response =
        await _remoteDataSource.addSalsePurchase(addSalsePurchaseRequest);

    try {
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        print(response.message);
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          response.message ?? LocaleKeys.ERROR.tr(),
        ));
      }
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
