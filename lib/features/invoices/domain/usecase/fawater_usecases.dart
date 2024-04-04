import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';

import '../repository/Fawater_repository.dart';

class GetFawaterTraderInvoiceUseCase
    implements BaseUseCase<void, TraderInvoiceModel> {
  final FawaterRepository _fawaterRepository;

  GetFawaterTraderInvoiceUseCase(this._fawaterRepository);

  @override
  Future<Either<Failure, TraderInvoiceModel>> execute(_) async {
    return await _fawaterRepository.getTraderInvoice();
  }
}

class GetFawaterSupplierInvoiceUseCase
    implements BaseUseCase<void, SupplierInvoiceModel> {
  final FawaterRepository _fawaterRepository;

  GetFawaterSupplierInvoiceUseCase(this._fawaterRepository);

  @override
  Future<Either<Failure, SupplierInvoiceModel>> execute(_) async {
    return await _fawaterRepository.getSupplierInvoice();
  }
}
