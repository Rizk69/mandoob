import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/debts/data/network/pay_dept_trader_request.dart';
import 'package:mandoob/features/debts/domain/model/debt_delegate_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_invoice_trader_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/model/pay_debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/usecase/get_debt_delegate_usecases.dart';
import 'package:mandoob/features/debts/domain/usecase/get_debt_invoice_trader_usecases.dart';
import 'package:mandoob/features/debts/domain/usecase/get_debt_trader_usecases.dart';
import 'package:mandoob/features/debts/domain/usecase/pay_debt_trader_usecases.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class DebtsCubit extends Cubit<DebtsState> {
  DebtsCubit(this._getDelegateDebtsUseCase, this._getTraderDebtsUseCase,
      this._payDebtTraderUseCase, this._getDebtInvoiceTraderUseCase)
      : super(DebtsInitial());

  static DebtsCubit get(context) => BlocProvider.of(context);

  final GetDelegateDebtsUseCase _getDelegateDebtsUseCase;
  final GetTraderDebtsUseCase _getTraderDebtsUseCase;
  final PayDebtTraderUseCase _payDebtTraderUseCase;
  final GetDebtInvoiceTraderUseCase _getDebtInvoiceTraderUseCase;

  DebtDelegateModel? delegateModel;
  DeptTraderModel? deptTraderModel;
  DebtInvoiceTraderModel? debtInvoiceTraderModel;
  PayDebtTraderModel? payDebtTraderModel;

  num traderId=0;
   num price=0;
   num currencyId=0;
   String dueDate='';

  setTraderId(num id) {
    traderId = id;
    emit(SetTraderIdState());
  }

  setPrice(String price) {
    final parsedPrice = num.tryParse(price);
    if (parsedPrice == null) {
      print("Failed to parse price: $price");
      this.price = 0;
    } else {
      this.price = parsedPrice;
    }
    emit(SetPriceState());
  }


  setCurrencyId(num id) {
    currencyId = id;
    emit(SetCurrencyState());
  }

  setDueDate(String date) {
    dueDate = date;
    emit(SetDueDateState());
  }

  Future<void> getDelegateDebts() async {
    emit(GetDelegateDebtsLoadingState());
    final result = await _getDelegateDebtsUseCase.execute('');
    result.fold((failure) => emit(GetDelegateDebtsErrorState(failure.message)),
        (success) {
      delegateModel = success;
      filterDelegateData = List.from(success.debts);

      emit(GetDelegateDebtsLoadedState());
    });
  }

  Future<void> getTraderDebts() async {
    emit(GetTraderDebtsLoadingState());
    final result = await _getTraderDebtsUseCase.execute('');
    result.fold((failure) => emit(GetTraderDebtsErrorState(failure.message)),
        (success) {
      deptTraderModel = success;
      filteredTraderData = List.from(success.debts);

      emit(GetTraderDebtsLoadedState());
    });
  }

  Future<void> payDebtTrader() async {
    emit(PayDebtTraderLoadingState());
    final result = await _payDebtTraderUseCase.execute(PayDeptTraderRequest(
        traderId: traderId.toString(),
        dueDate: dueDate.toString(),
        currencyId: currencyId.toString(),
        price: price.toString()));
    result.fold((failure) {


      emit(PayDebtTraderErrorState(failure.message));},
        (success) {
      payDebtTraderModel = success;
      emit(PayDebtTraderLoadedState());
    });
  }

  Future<void> getDebtInvoiceTrader(int invoiceId) async {
    emit(GetDebtInvoiceTraderLoadingState());
    final result = await _getDebtInvoiceTraderUseCase.execute(invoiceId);
    result.fold(
        (failure) => emit(GetDebtInvoiceTraderErrorState(failure.message)),
        (success) {
      debtInvoiceTraderModel = success;
      emit(GetDebtInvoiceTraderLoadedState());
    });
  }

  void toggleCurrentOrdersExpansion() {
    emit(CurrentOrdersExpanded());
  }

  void togglePreviousOrdersExpansion() {
    emit(PreviousOrdersExpanded());
  }


  List<DebtDelegateDataModel> filterDelegateData = [];
  List<DebtDetail> filteredTraderData = [];

  void searchDebts(String query) {
    // If the query is empty, use the full list
    if (query.isEmpty) {
      filterDelegateData = List.from(delegateModel!.debts);
      filteredTraderData = List.from(deptTraderModel!.debts);
    } else {
      // Filter based on the date or other fields
      filterDelegateData = delegateModel!.debts
          .where((order) => order.date == query ||
          order.reasonExpensesNameAr.contains(query) ||
          order.reasonExpensesNameEn.toString().toLowerCase().contains(query.toLowerCase()) ||
          order.date.toString().contains(query))
          .toList();

      filteredTraderData = deptTraderModel!.debts
          .where((order) => order.dueDate == query ||
          order.lastDate.contains(query) ||
          order.traderName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    emit(GetTraderDebtsLoadedState());
    emit(GetTraderDebtsLoadedState());
  }



}
