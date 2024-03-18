import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/trader/data/data_source/remote_trade_data_source.dart';
import 'package:mandoob/features/trader/data/mapper/trade_mapper.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class TradeRepositoryImpl extends TradeRepository {
  final RemoteTradeDataSource _remoteTradeDataSource;
  final NetworkInfo _networkInfo;

  TradeRepositoryImpl(this._remoteTradeDataSource, this._networkInfo);

  @override
  Future<Either<Failure, TradeModel>> getTrades() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteTradeDataSource.getTrades();
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
}
