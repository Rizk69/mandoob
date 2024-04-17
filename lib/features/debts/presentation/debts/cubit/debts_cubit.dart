import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/debts/domain/model/debt_delegate_model.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/domain/usecase/get_debt_delegate_usecases.dart';
import 'package:mandoob/features/debts/domain/usecase/get_debt_trader_usecases.dart';
import 'package:mandoob/features/debts/presentation/debts/cubit/debts_state.dart';


class DebtsCubit extends Cubit<DebtsState> {

  DebtsCubit(this._getDelegateDebtsUseCase,this._getTraderDebtsUseCase) : super(DebtsInitial());


  static DebtsCubit get(context) => BlocProvider.of(context);


  final GetDelegateDebtsUseCase _getDelegateDebtsUseCase;
  final GetTraderDebtsUseCase _getTraderDebtsUseCase;


  DebtDelegateModel ? delegateModel;
  DeptTraderModel ? deptTraderModel;

  Future<void> getDelegateDebts() async {
    emit(GetDelegateDebtsLoadingState());
    final result = await _getDelegateDebtsUseCase.execute('');
    result
        .fold((failure) => emit(GetDelegateDebtsErrorState(failure.message)),
            (success) {
              delegateModel = success;

          emit(GetDelegateDebtsLoadedState());
        });
  }


  Future<void> getTraderDebts() async {
    emit(GetTraderDebtsLoadingState());
    final result = await _getTraderDebtsUseCase.execute('');
    result
        .fold((failure) => emit(GetTraderDebtsErrorState(failure.message)),
            (success) {
              deptTraderModel = success;
          emit(GetTraderDebtsLoadedState());
        });
  }

  void toggleCurrentOrdersExpansion() {
    emit(CurrentOrdersExpanded());
  }

  void togglePreviousOrdersExpansion() {
    emit(PreviousOrdersExpanded());
  }

}

