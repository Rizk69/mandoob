import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/debts/data/data_source/debt_data_source.dart';
import 'package:mandoob/features/debts/data/mapper/debt_trader_mapper.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/repository/debt_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class RepositoryDebtImpl extends DebtRepository {
  final RemoteDebtDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryDebtImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, DeptTraderModel>> getDebtTrader() async {
    final response = await _remoteDataSource.getDebtTrader();

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
}
