import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class GetExpensesReasonsLoadingState extends ExpensesState {}

class GetExpensesReasonsErrorState extends ExpensesState {
  final String message;
  GetExpensesReasonsErrorState(this.message);
}

class GetExpensesReasonsLoadedState extends ExpensesState {}

class ChoseCurrency extends ExpensesState {
  final int? reasonExpenseId;
  ChoseCurrency({required this.reasonExpenseId});
}

class UpdatedPriceState extends ExpensesState {
  final String newPrice;
  UpdatedPriceState(this.newPrice);
}

class SetReasonExpenseIdState extends ExpensesState {
  final int newId;
  SetReasonExpenseIdState(this.newId);
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

class ExpensesAddedLoadedState extends ExpensesState {
  final String message;
  ExpensesAddedLoadedState(this.message);
}

class ImagePickedState extends ExpensesState {
  final XFile? imageFile;
  ImagePickedState({this.imageFile});
}
