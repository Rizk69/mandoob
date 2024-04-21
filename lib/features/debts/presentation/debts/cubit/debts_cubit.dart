import 'package:flutter_bloc/flutter_bloc.dart';
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

  num? traderId;
  num? price;
  num? currencyId;
  String? dueDate;

  setTraderId(num id) {
    traderId = id;
    emit(SetTraderIdState());
  }

  setPrice(String price) {
    this.price = num.tryParse(price) ?? 0;
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

      emit(GetDelegateDebtsLoadedState());
    });
  }

  Future<void> getTraderDebts() async {
    emit(GetTraderDebtsLoadingState());
    final result = await _getTraderDebtsUseCase.execute('');
    result.fold((failure) => emit(GetTraderDebtsErrorState(failure.message)),
        (success) {
      deptTraderModel = success;
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
    result.fold((failure) => emit(PayDebtTraderErrorState(failure.message)),
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
}
