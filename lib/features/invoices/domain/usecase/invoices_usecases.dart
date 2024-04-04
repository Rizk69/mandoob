import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';

import '../repository/invoices_repository.dart';

class GetInvoicesTraderInvoiceUseCase
    implements BaseUseCase<void, TraderInvoiceModel> {
  final InvoicesRepository _fawaterRepository;

  GetInvoicesTraderInvoiceUseCase(this._fawaterRepository);

  @override
  Future<Either<Failure, TraderInvoiceModel>> execute(_) async {
    return await _fawaterRepository.getTraderInvoice();
  }
}

class GetInvoicesSupplierInvoiceUseCase
    implements BaseUseCase<void, SupplierInvoiceModel> {
  final InvoicesRepository _fawaterRepository;

  GetInvoicesSupplierInvoiceUseCase(this._fawaterRepository);

  @override
  Future<Either<Failure, SupplierInvoiceModel>> execute(_) async {
    return await _fawaterRepository.getSupplierInvoice();
  }
}

class GetSupplierInvoiceDetailsUseCase
    implements BaseUseCase<void, SupplierDetailsInvoiceModel> {
  final InvoicesRepository _fawaterRepository;

  GetSupplierInvoiceDetailsUseCase(this._fawaterRepository);

  @override
  Future<Either<Failure, SupplierDetailsInvoiceModel>> execute(_) async {
    return await _fawaterRepository.getSupplierInvoiceDetails();
  }
}

class GetTraderInvoiceDetailsUseCase
    implements BaseUseCase<int, TraderDetailsInvoiceModel> {
  final InvoicesRepository _fawaterRepository;

  GetTraderInvoiceDetailsUseCase(this._fawaterRepository);

  @override
  Future<Either<Failure, TraderDetailsInvoiceModel>> execute(
      int invoiceId) async {
    return await _fawaterRepository.getTraderInvoiceDetails(invoiceId);
  }
}
