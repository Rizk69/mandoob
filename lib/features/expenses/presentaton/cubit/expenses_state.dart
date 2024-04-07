part of 'expenses_cubit.dart';

@immutable
abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}


class GetExpensesReasonsLoadingState extends ExpensesState {}


class GetExpensesReasonsErrorState extends ExpensesState {

  final String message ;

  GetExpensesReasonsErrorState(this.message);
}

class GetExpensesReasonsLoadedState extends ExpensesState {}
