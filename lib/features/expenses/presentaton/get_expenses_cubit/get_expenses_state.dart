part of 'get_expenses_cubit.dart';

@immutable
abstract class GetExpensesState {}

class GetExpensesInitial extends GetExpensesState {}


class GetExpensesLoadingState extends GetExpensesState {}

class GetExpensesErrorState extends GetExpensesState {
  final String message;
  GetExpensesErrorState(this.message);
}

class GetExpensesLoadedState extends GetExpensesState {}