import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/custody/el_eahduh/data/data_source/eahduh_data_source.dart';
import 'package:mandoob/features/custody/el_eahduh/data/mapper/eahduh_mapper.dart';
import 'package:mandoob/features/custody/el_eahduh/domain/repository/eahduh_repository.dart';

import 'package:mandoob/generated/locale_keys.g.dart';

import '../../domain/model/eahduh_order_model.dart';

class RepositoryEahduhImpl extends EahduhRepository {
  final RemoteEahduhDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryEahduhImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, EahduhOrderModel>> getEahduhOrder() async {
    try {
      final response = await _remoteDataSource.getEahduhOrder();
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
}
