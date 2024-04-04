import 'package:mandoob/features/invoices/data/responses/supplier_details_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_details_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_invoice_response.dart';

import '../network/fawater_api.dart';
import '../responses/supplier_invoice_response.dart';

abstract class RemoteInvoicesSource {
  Future<TraderInvoiceResponse> getTraderInvoice();

  Future<SupplierInvoiceResponse> getSupplierInvoice();

  Future<SupplierDetailsInvoiceResponse> getSupplierInvoiceDetails();

  Future<TraderDetailsInvoiceResponse> getTraderInvoiceDetails(int invoiceId);
}

class InvoicesSourceImpl extends RemoteInvoicesSource {
  final FawaterServiceClient _fawaterServiceClient;

  InvoicesSourceImpl(this._fawaterServiceClient);

  @override
  Future<TraderInvoiceResponse> getTraderInvoice() {
    return _fawaterServiceClient.getTraderInvoice();
  }

  @override
  Future<SupplierInvoiceResponse> getSupplierInvoice() {
    return _fawaterServiceClient.getSupplierInvoice();
  }

  @override
  Future<TraderDetailsInvoiceResponse> getTraderInvoiceDetails(int invoiceId) {
    return _fawaterServiceClient.getTraderInvoiceDetails(invoiceId);
  }

  @override
  Future<SupplierDetailsInvoiceResponse> getSupplierInvoiceDetails() {
    return _fawaterServiceClient.getSupplierInvoiceDetails();
  }
}
