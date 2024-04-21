import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/debts/data/data_source/debt_data_source.dart';
import 'package:mandoob/features/debts/data/mapper/debt_delegate_mapper.dart';
import 'package:mandoob/features/debts/data/mapper/debt_invoice_trader_mapper.dart';
import 'package:mandoob/features/debts/data/mapper/debt_trader_mapper.dart';
import 'package:mandoob/features/debts/data/mapper/pay_debt_trader_mapper.dart';
import 'package:mandoob/features/debts/data/network/pay_dept_trader_request.dart';

import 'package:mandoob/features/debts/domain/model/debt_delegate_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_invoice_trader_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/model/pay_debt_trader_model.dart';
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

  @override
  Future<Either<Failure, DebtDelegateModel>> getDebtDelegate() async {
    final response = await _remoteDataSource.getDebtDelegate();

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
  Future<Either<Failure, DebtInvoiceTraderModel>> getDebtInvoiceTrade(int invoiceId) async{
    final response = await _remoteDataSource.getDebtInvoiceTrade(invoiceId);

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
  Future<Either<Failure, PayDebtTraderModel>> payDebtTrader(PayDeptTraderRequest payDeptTraderRequest)async {
    final response = await _remoteDataSource.payDebtTrader(payDeptTraderRequest);

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
