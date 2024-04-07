import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandoob/features/expenses/data/responses/addExpenses_requests.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/features/expenses/domain/usecase/get_reason_expenses_usecases.dart';
import 'package:meta/meta.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit(
      this._getExpensesReasonsUseCase,
      this._addExpensesReasonsUseCase,
      ) : super(ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  final GetExpensesReasonsUseCase _getExpensesReasonsUseCase;
  final AddGetExpensesReasonsUseCase _addExpensesReasonsUseCase;

  ReasonExpensesModel? model;
  XFile? image;
  int? reasonExpenseId;
  String? price;
  String? currencyId;
  String? count;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {}
  }

  void setReasonExpenseId(int newValue) {
    reasonExpenseId = newValue;
    emit(ChoseCurrency());
  }

  void setPrice(String newPrice) {
    price = newPrice;
    emit(UpdatedPriceState(newPrice));
  }

  void setCurrencyId(String newCurrencyId) {
    currencyId = newCurrencyId;
    emit(UpdatedCurrencyIdState(newCurrencyId));
  }

  void setupdateCount(String newCount) {
    count = newCount;
    emit(UpdatedCountState(newCount));
  }

  void clearFields() {
    image = null;
    reasonExpenseId = null;
    price = null;
    currencyId = null;
    count = null;
    emit(ClearedFieldsState());
  }

  getReasonExpenses() async {
    if (isClosed) return; // Check if the cubit is closed
    emit(GetExpensesReasonsLoadingState());
    final result = await _getExpensesReasonsUseCase.execute('');
    if (isClosed) return; // Check again because the operation is async
    result.fold(
          (failure) => emit(GetExpensesReasonsErrorState(failure.message)),
          (success) {
        model = success;
        emit(GetExpensesReasonsLoadedState());
      },
    );
  }

  addReasonExpenses(AddExpensesRequests addExpensesRequests) async {
    emit(AddingExpensesLoadingState());
    final result = await _addExpensesReasonsUseCase.execute(addExpensesRequests);
    result.fold(
          (failure) => emit(AddingExpensesErrorState(failure.message)),
          (success) {
        emit(ExpensesAddedState());
        clearFields(); // Clear fields after successful addition
      },
    );
  }
}
