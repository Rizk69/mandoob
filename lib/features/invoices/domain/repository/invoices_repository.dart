import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';



abstract class InvoicesRepository {

  Future<Either<Failure, TraderInvoiceModel>> getTraderInvoice();
  Future<Either<Failure, SupplierInvoiceModel>> getSupplierInvoice();


  Future<Either<Failure, SupplierDetailsInvoiceModel>> getSupplierInvoiceDetails ();
  Future<Either<Failure, TraderDetailsInvoiceModel>> getTraderInvoiceDetails(int invoiceId);

}
