part of 'expenses_cubit.dart';

@immutable
abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class GetExpensesReasonsLoadingState extends ExpensesState {}

class GetExpensesReasonsErrorState extends ExpensesState {
  final String message;

  GetExpensesReasonsErrorState(this.message);
}

class GetExpensesReasonsLoadedState extends ExpensesState {}

class ChoseCurrency extends ExpensesState {}

class UpdatedPriceState extends ExpensesState {
  final String newPrice;

  UpdatedPriceState(this.newPrice);
}

class UpdatedCurrencyIdState extends ExpensesState {
  final String newCurrencyId;

  UpdatedCurrencyIdState(this.newCurrencyId);
}

class UpdatedCountState extends ExpensesState {
  final String newCount;

  UpdatedCountState(this.newCount);
}

class ClearedFieldsState extends ExpensesState {}

class AddingExpensesLoadingState extends ExpensesState {}

class AddingExpensesErrorState extends ExpensesState {
  final String message;

  AddingExpensesErrorState(this.message);
}

class ExpensesAddedState extends ExpensesState {}
