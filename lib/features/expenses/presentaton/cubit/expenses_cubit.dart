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
      this._getExpensesReasonsUseCase, this._addExpensesReasonsUseCase)
      : super(ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  final GetExpensesReasonsUseCase _getExpensesReasonsUseCase;
  final AddGetExpensesReasonsUseCase _addExpensesReasonsUseCase;

  ReasonExpensesModel? model;
   XFile? image;
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // print('Picked Image Path: ${image.path}');
    }
  }
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

  addReasonExpenses(AddExpensesRequests addExpensesRequests) async {
    emit(GetExpensesReasonsLoadingState());
    final result =
        await _addExpensesReasonsUseCase.execute(addExpensesRequests);
    result
        .fold((failure) => emit(GetExpensesReasonsErrorState(failure.message)),
            (success) {
      model = success;
      emit(GetExpensesReasonsLoadedState());
    });
  }
}
