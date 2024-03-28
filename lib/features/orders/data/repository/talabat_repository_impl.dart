import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/orders/data/mapper/talabat_mapper.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import '../../domain/model/talabat_model.dart';
import '../../domain/repository/talabat_repository.dart';
import '../data_source/remote_talabat_data_source.dart';

class TalabatRepositoryImpl extends TalabatRepository {
  final RemoteTalabatSource _remoteTalabatSource;
  final NetworkInfo _networkInfo;

  TalabatRepositoryImpl(this._remoteTalabatSource, this._networkInfo);



  @override
  Future<Either<Failure, TalabatModel>> getOldOrders()async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteTalabatSource.getOldOrders();
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
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, TalabatModel>> getPresentOrders() async{
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteTalabatSource.getPresentOrders();
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
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
}}
