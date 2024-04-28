import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/usecase/invoices_usecases.dart';
import 'package:mandoob/features/invoices/presentation/fawater/cubit/invoice_state.dart';

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
      : super(InvoiceInitState());
  TraderInvoiceModel? traderInvoiceModel;
  SupplierInvoiceModel? supplierInvoiceModel;
  SupplierDetailsInvoiceModel? supplierDetailsInvoiceModel;
  TraderDetailsInvoiceModel? traderDetailsInvoiceModel;

  static FawaterViewCubit get(context) => BlocProvider.of(context);

  void getFawaterTraderInvoice() async {
    emit(LoadingTraderInvoiceState());
    final result = await _getFawaterTraderInvoiceUseCase.execute("");
    result.fold((failure) => emit(ErrorTraderInvoiceState(failure.message)),
        (success) {
      traderInvoiceModel = success;
      filteredTraderInvoices = List.from(success.data);
      emit(LoadedTraderInvoiceState(filteredTraderInvoices));
    });
  }

  void getFawaterSupplierInvoice() async {
    emit(LoadingSupplierInvoiceState()); // Emit loading state
    final result = await _getFawaterSupplierInvoiceUseCase.execute("");
    result.fold((failure) => emit(ErrorSupplierInvoiceState(failure.message)),
        // Emit error state
        (success) {
      supplierInvoiceModel = success;
      emit(LoadedSupplierInvoiceState(success));
    });
  }

  void getFawaterTraderInvoiceDetails({required int invoiceId}) async {
    emit(LoadingTraderInvoiceDetailsState());
    final result = await _getTraderInvoiceDetailsUseCase.execute(invoiceId);
    result.fold(
        (failure) => emit(ErrorTraderInvoiceDetailsState(failure.message)),
        (success) {
      traderDetailsInvoiceModel = success;
      emit(LoadedTraderInvoiceDetailsState(success));
    });
  }

  void getFawaterSupplierInvoiceDetails() async {
    emit(LoadingSupplierInvoiceDetailsState()); // Emit loading state
    final result = await _getSupplierInvoiceDetailsUseCase.execute("");
    result.fold(
        (failure) => emit(ErrorSupplierInvoiceDetailsState(failure.message)),
        // Emit error state
        (success) {
      supplierDetailsInvoiceModel = success;
      emit(LoadedSupplierInvoiceDetailsState(success));
    });
  }

  List<TraderInvoiceDataModel> filteredTraderInvoices = [];

  void searchInvoicesByQuery(String query) {
    if (query.isEmpty) {
      filteredTraderInvoices = traderInvoiceModel?.data ?? [];
      emit(LoadedTraderInvoiceState(filteredTraderInvoices));
    } else {
      filteredTraderInvoices = traderInvoiceModel?.data
              .where((invoice) =>
                  invoice.invoiceNo.toLowerCase().contains(query.toLowerCase()) ||
                  invoice.customerName.toLowerCase().contains(query.toLowerCase()) ||
                  invoice.date.contains(query))
              .toList() ??
          [];

      emit(LoadedTraderInvoiceState(filteredTraderInvoices));
    }
  }


  Invoice? selectedInvoice; // New field to track the selected invoice

  void selectInvoice(int index) {
    selectedInvoice = supplierDetailsInvoiceModel?.invoices[index];
    emit(InvoiceSelectedState(selectedInvoice!));
  }

}
