import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'expenses_state.dart';
import 'package:mandoob/features/expenses/data/responses/addExpenses_requests.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/features/expenses/domain/usecase/get_reason_expenses_usecases.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final GetExpensesReasonsUseCase _getExpensesReasonsUseCase;
  final AddGetExpensesReasonsUseCase _addExpensesReasonsUseCase;

  ExpensesCubit(
      this._getExpensesReasonsUseCase, this._addExpensesReasonsUseCase)
      : super(ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  ReasonExpensesModel? model;
  XFile? image;
  int? reasonExpenseId;
  String? price;
  String? currencyId;
  String? count;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      image = selectedImage;
      emit(ImagePickedState(imageFile: selectedImage));
    }
  }

  void setReasonExpenseId(int newValue) {
    reasonExpenseId=newValue;
    emit(SetReasonExpenseIdState(newValue));

  }
  void setPrice(String newPrice) {
    price=newPrice;
    emit(UpdatedPriceState(newPrice));
  }

  void setCurrencyId(String newCurrencyId) {
    currencyId=newCurrencyId;
    emit(ChoseCurrency(reasonExpenseId: int.tryParse(newCurrencyId)));
  }

  void setUpdateCount(String newCount) {
    count=newCount;
    emit(UpdatedCountState(newCount));
  }

  void clearFields() => emit(ClearedFieldsState());

  Future<void> getReasonExpenses() async {
    emit(GetExpensesReasonsLoadingState());
    final result = await _getExpensesReasonsUseCase.execute('');
    result
        .fold((failure) => emit(GetExpensesReasonsErrorState(failure.message)),
            (success) {
      model = success;
      emit(GetExpensesReasonsLoadedState());
    });
  }

  Future<void> submitExpense() async {
    if (image == null ||
        reasonExpenseId == null ||
        price == null ||
        currencyId == null ||
        count == null) {
      print('All fields must be filled.');
      emit(AddingExpensesErrorState('All fields must be filled.'));
      return;
    }

    final addExpensesRequests = AddExpensesRequests(
      image: image,
      currencyId: currencyId,
      count: count,
      price: price,
      reasonExpenseId: reasonExpenseId.toString(),
    );
    await addReasonExpenses(addExpensesRequests);
  }

  Future<void> addReasonExpenses(
      AddExpensesRequests addExpensesRequests) async {
    emit(AddingExpensesLoadingState());
    final result =
        await _addExpensesReasonsUseCase.execute(addExpensesRequests);
    result.fold(
      (failure) {
        emit(AddingExpensesErrorState(failure.message));
      },
      (success) => emit(ExpensesAddedLoadedState()),
    );
    clearFields();
  }
}
