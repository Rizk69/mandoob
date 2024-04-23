import 'package:mandoob/features/invoices/domain/model/supplier_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';

abstract class FawaterViewState {}

class InvoiceInitState extends FawaterViewState {}



class LoadingTraderInvoiceState extends FawaterViewState {}

class ErrorTraderInvoiceState extends FawaterViewState {
  final String errorMessage;

  ErrorTraderInvoiceState(this.errorMessage); // Field to hold error messages
}

class LoadedTraderInvoiceState extends FawaterViewState {
  final List<TraderInvoiceDataModel> traderInvoiceModel;

  LoadedTraderInvoiceState(this.traderInvoiceModel); // Field for loaded data
}

class LoadingSupplierInvoiceState extends FawaterViewState {}

class ErrorSupplierInvoiceState extends FawaterViewState {
  final String errorMessage;

  ErrorSupplierInvoiceState(this.errorMessage);
}

class LoadedSupplierInvoiceState extends FawaterViewState {
  final SupplierInvoiceModel supplierInvoiceModel;

  LoadedSupplierInvoiceState(this.supplierInvoiceModel);
}

class LoadingTraderInvoiceDetailsState extends FawaterViewState {}

class ErrorTraderInvoiceDetailsState extends FawaterViewState {
  final String errorMessage;

  ErrorTraderInvoiceDetailsState(this.errorMessage);
}

class LoadedTraderInvoiceDetailsState extends FawaterViewState {
  final TraderDetailsInvoiceModel traderDetailsInvoiceModel;

  LoadedTraderInvoiceDetailsState(this.traderDetailsInvoiceModel);
}

class LoadingSupplierInvoiceDetailsState extends FawaterViewState {}

class ErrorSupplierInvoiceDetailsState extends FawaterViewState {
  final String errorMessage;

  ErrorSupplierInvoiceDetailsState(this.errorMessage);
}

class LoadedSupplierInvoiceDetailsState extends FawaterViewState {
  final SupplierDetailsInvoiceModel supplierDetailsInvoiceModel;

  LoadedSupplierInvoiceDetailsState(this.supplierDetailsInvoiceModel);
}
