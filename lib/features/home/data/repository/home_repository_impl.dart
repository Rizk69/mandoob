import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/home/data/data_source/remote_home_data_source.dart';
import 'package:mandoob/features/home/data/mapper/home_mapper.dart';
import 'package:mandoob/features/home/domain/model/home_model.dart';
import 'package:mandoob/features/home/domain/repository/home_repository.dart';
import 'package:mandoob/features/trader/data/data_source/remote_trade_data_source.dart';
import 'package:mandoob/features/trader/data/mapper/trade_mapper.dart';
import 'package:mandoob/features/trader/data/network/trade_requests.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class HomeRepositoryImpl extends HomeRepository {
  final RemoteHomeDataSource _remoteHomeDataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImpl(this._remoteHomeDataSource, this._networkInfo);


  @override
  Future<Either<Failure, HomeModel>> editShowPrice(int price) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteHomeDataSource.editShowPrice(price);
        if (response.status == true) {
          print(response.status);
          return Right(response.toDomain());
        } else {
          print(response.message);
          return Left(Failure(
            ResponseCode.UNAUTHORIZED,
            response.message!??"خطأ",
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
  Future<Either<Failure, HomeModel>> getHome() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteHomeDataSource.getHome();
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
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
