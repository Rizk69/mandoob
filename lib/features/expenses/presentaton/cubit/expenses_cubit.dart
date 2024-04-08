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
  bool _isClosed = false;

  // Override the close method to update the _isClosed flag
  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }

  // Utility method to safely emit states only if the cubit is not closed
  void _safeEmit(ExpensesState state) {
    if (!_isClosed) {
      emit(state);
    }
  }
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      image = selectedImage;
      _safeEmit(ImagePickedState(imageFile: selectedImage));
    }
  }

  void setReasonExpenseId(int newValue) {
    reasonExpenseId=newValue;
    _safeEmit(SetReasonExpenseIdState(newValue));

  }
  void setPrice(String newPrice) {
    price=newPrice;
    _safeEmit(UpdatedPriceState(newPrice));
  }

  void setCurrencyId(String newCurrencyId) {
    currencyId=newCurrencyId;
    _safeEmit(ChoseCurrency(reasonExpenseId: int.tryParse(newCurrencyId)));
  }

  void setUpdateCount(String newCount) {
    count=newCount;
    _safeEmit(UpdatedCountState(newCount));
  }

  void clearFields() => _safeEmit(ClearedFieldsState());

  Future<void> getReasonExpenses() async {
    _safeEmit(GetExpensesReasonsLoadingState());
    final result = await _getExpensesReasonsUseCase.execute('');
    result
        .fold((failure) => _safeEmit(GetExpensesReasonsErrorState(failure.message)),
            (success) {
      model = success;
      _safeEmit(GetExpensesReasonsLoadedState());
    });
  }

  Future<void> submitExpense() async {
    if (image == null ||
        reasonExpenseId == null ||
        price == null ||
        currencyId == null ||
        count == null) {
      print('All fields must be filled.');
      _safeEmit(AddingExpensesErrorState('All fields must be filled.'));
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
    _safeEmit(AddingExpensesLoadingState());
    final result =
        await _addExpensesReasonsUseCase.execute(addExpensesRequests);
    result.fold(
      (failure) {
        _safeEmit(AddingExpensesErrorState(failure.message));
      },
      (success) => _safeEmit(ExpensesAddedLoadedState()),
    );
    clearFields();
  }

}
