import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/invoices/data/data_source/remote_invoices_data_source.dart';
import 'package:mandoob/features/invoices/data/mapper/invoices_mapper.dart';
import 'package:mandoob/features/invoices/data/mapper/supplier_invoces_details_mapper.dart';
import 'package:mandoob/features/invoices/data/mapper/trader_invoces_details_mapper.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/repository/invoices_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class InvoicesRepositoryImpl extends InvoicesRepository {
  final RemoteInvoicesSource _remoteFawaterSource;
  final NetworkInfo _networkInfo;

  InvoicesRepositoryImpl(this._remoteFawaterSource, this._networkInfo);

  @override
  Future<Either<Failure, TraderInvoiceModel>> getTraderInvoice() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteFawaterSource.getTraderInvoice();
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
  Future<Either<Failure, SupplierInvoiceModel>> getSupplierInvoice() async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteFawaterSource.getSupplierInvoice();
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
  Future<Either<Failure, TraderDetailsInvoiceModel>> getTraderInvoiceDetails(int invoiceId) async {
    if (await _networkInfo.isConnect) {
      print('invoiceId$invoiceId');
      final response = await _remoteFawaterSource.getTraderInvoiceDetails(invoiceId);

      try {
        if (response.status == true) {
          print(response.status);
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            ResponseCode.UNAUTHORIZED,
            response.message??"",
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

  @override
  Future<Either<Failure, SupplierDetailsInvoiceModel>> getSupplierInvoiceDetails() async {
    if (await _networkInfo.isConnect) {
      final response = await _remoteFawaterSource.getSupplierInvoiceDetails();

      try {
        if (response.status == true) {
          print(response.status);
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            ResponseCode.UNAUTHORIZED,
            response.message??"",
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
