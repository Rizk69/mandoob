import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';



abstract class FawaterRepository {

  Future<Either<Failure, TraderInvoiceModel>> getTraderInvoice();
  Future<Either<Failure, SupplierInvoiceModel>> getSupplierInvoice();

}
