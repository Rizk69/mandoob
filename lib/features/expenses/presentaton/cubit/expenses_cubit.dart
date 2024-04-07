import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/features/expenses/domain/usecase/get_reason_expenses_usecases.dart';
import 'package:meta/meta.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit(this._getExpensesReasonsUseCase) : super(ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  final GetExpensesReasonsUseCase _getExpensesReasonsUseCase;

  ReasonExpensesModel? model;

  getReasonExpenses() async {
    emit(GetExpensesReasonsLoadingState());
    final result = await _getExpensesReasonsUseCase.execute('');
    result
        .fold((failure) => emit(GetExpensesReasonsErrorState(failure.message)),
            (success) {
      model = success;
      emit(GetExpensesReasonsLoadedState());
    });
  }
}
