import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/usecase/invoices_usecases.dart';

enum FawaterViewState {   currentOrdersExpanded,
  previousOrdersExpanded,
  loadingTraderInvoice,
  errorTraderInvoice,
  loadedTraderInvoice,
  loadingSupplierInvoice,
  errorSupplierInvoice,
  loadedSupplierInvoice }

class FawaterViewCubit extends Cubit<FawaterViewState> {


  GetInvoicesTraderInvoiceUseCase _getFawaterTraderInvoiceUseCase;
  GetInvoicesSupplierInvoiceUseCase _getFawaterSupplierInvoiceUseCase;
  FawaterViewCubit(this._getFawaterTraderInvoiceUseCase, this._getFawaterSupplierInvoiceUseCase)
      : super(FawaterViewState.currentOrdersExpanded);
  TraderInvoiceModel? traderInvoiceModel;
  SupplierInvoiceModel? supplierInvoiceModel;
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
    result.fold((failure) => emit(FawaterViewState.errorTraderInvoice), (success) {
      traderInvoiceModel = success;
      emit(FawaterViewState.loadedTraderInvoice);
    });
  }

  void getFawaterSupplierInvoice() async {
    emit(FawaterViewState.loadingSupplierInvoice); // Emit loading state
    final result = await _getFawaterSupplierInvoiceUseCase.execute("");
    result.fold(
            (failure) => emit(FawaterViewState.errorSupplierInvoice), // Emit error state
            (success) {
              supplierInvoiceModel = success;
          emit(FawaterViewState.loadedSupplierInvoice);
        });
  }
}
