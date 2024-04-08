import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/expenses/domain/model/expenses_model.dart';
import 'package:mandoob/features/expenses/domain/usecase/get_expenses_usecases.dart';
import 'package:meta/meta.dart';

part 'get_expenses_state.dart';

class GetExpensesCubit extends Cubit<GetExpensesState> {
  GetExpensesCubit(this._getExpensesUseCase) : super(GetExpensesInitial());

  final GetExpensesUseCase _getExpensesUseCase;

  static GetExpensesCubit get(context) => BlocProvider.of(context);

  ExpensesModel? expensesModel;

  Future<void> getExpenses() async {
    emit(GetExpensesLoadingState());
    final result = await _getExpensesUseCase.execute('');
    result.fold(
          (failure) {
        emit(GetExpensesErrorState(failure.message));
      },
          (success) {
        expensesModel = success;
        emit(GetExpensesLoadedState());
      },
    );
  }


}
