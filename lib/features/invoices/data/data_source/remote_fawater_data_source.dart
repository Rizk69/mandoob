
import 'package:mandoob/features/invoices/data/responses/trader_invoice_response.dart';

import '../network/fawater_api.dart';
import '../responses/supplier_invoice_response.dart';

abstract class RemoteFawaterSource {
  Future<TraderInvoiceResponse> getTraderInvoice();

  Future<SupplierInvoiceResponse> getSupplierInvoice();


}

class FawaterSourceImpl extends RemoteFawaterSource {
  final FawaterServiceClient _fawaterServiceClient;

  FawaterSourceImpl(this._fawaterServiceClient);

  @override
  Future<TraderInvoiceResponse> getTraderInvoice() {
return _fawaterServiceClient.getTraderInvoice();
  }

  @override
  Future<SupplierInvoiceResponse> getSupplierInvoice() {
    return _fawaterServiceClient.getSupplierInvoice();
  }


}
