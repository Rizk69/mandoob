import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/usecase/invoices_usecases.dart';

enum FawaterViewState {
  currentOrdersExpanded,
  previousOrdersExpanded,
  loadingTraderInvoice,
  errorTraderInvoice,
  loadedTraderInvoice,
  loadingSupplierInvoice,
  errorSupplierInvoice,
  loadedSupplierInvoice,
  loadingTraderInvoiceDetails,
  errorTraderInvoiceDetails,
  loadedTraderInvoiceDetails,
  loadingSupplierInvoiceDetails,
  errorSupplierInvoiceDetails,
  loadedSupplierInvoiceDetails
}

class FawaterViewCubit extends Cubit<FawaterViewState> {
  GetInvoicesTraderInvoiceUseCase _getFawaterTraderInvoiceUseCase;
  GetInvoicesSupplierInvoiceUseCase _getFawaterSupplierInvoiceUseCase;
  GetTraderInvoiceDetailsUseCase _getTraderInvoiceDetailsUseCase;
  GetSupplierInvoiceDetailsUseCase _getSupplierInvoiceDetailsUseCase;
  FawaterViewCubit(
      this._getFawaterTraderInvoiceUseCase,
      this._getFawaterSupplierInvoiceUseCase,
      this._getTraderInvoiceDetailsUseCase,
      this._getSupplierInvoiceDetailsUseCase)
      : super(FawaterViewState.currentOrdersExpanded);
  TraderInvoiceModel? traderInvoiceModel;
  SupplierInvoiceModel? supplierInvoiceModel;
  SupplierDetailsInvoiceModel? supplierDetailsInvoiceModel;
  TraderDetailsInvoiceModel? traderDetailsInvoiceModel;
  static FawaterViewCubit get(context) => BlocProvider.of(context);

  void toggleCurrentOrdersExpansion() {
    emit(FawaterViewState.currentOrdersExpanded);
  }

  void togglePreviousOrdersExpansion() {
    emit(FawaterViewState.previousOrdersExpanded);
  }

  void getFawaterTraderInvoice() async {
    emit(FawaterViewState.loadingTraderInvoice);
    final result = await _getFawaterTraderInvoiceUseCase.execute("");
    result.fold((failure) => emit(FawaterViewState.errorTraderInvoice),
        (success) {
      traderInvoiceModel = success;
      emit(FawaterViewState.loadedTraderInvoice);
    });
  }

  void getFawaterSupplierInvoice() async {
    emit(FawaterViewState.loadingSupplierInvoice); // Emit loading state
    final result = await _getFawaterSupplierInvoiceUseCase.execute("");
    result.fold(
        (failure) =>
            emit(FawaterViewState.errorSupplierInvoice), // Emit error state
        (success) {
      supplierInvoiceModel = success;
      emit(FawaterViewState.loadedSupplierInvoice);
    });
  }

  void getFawaterTraderInvoiceDetails({required int invoiceId}) async {
    emit(FawaterViewState.loadingTraderInvoiceDetails);
    final result = await _getTraderInvoiceDetailsUseCase.execute(invoiceId);
    result.fold((failure) => emit(FawaterViewState.errorTraderInvoiceDetails),
        (success) {
      traderDetailsInvoiceModel = success;
      emit(FawaterViewState.loadedTraderInvoiceDetails);
    });
  }

  void getFawaterSupplierInvoiceDetails() async {
    emit(FawaterViewState.loadingSupplierInvoiceDetails); // Emit loading state
    final result = await _getSupplierInvoiceDetailsUseCase.execute("");
    result.fold(
        (failure) => emit(
            FawaterViewState.errorSupplierInvoiceDetails), // Emit error state
        (success) {
      supplierDetailsInvoiceModel = success;
      emit(FawaterViewState.loadedSupplierInvoiceDetails);
    });
  }
}
