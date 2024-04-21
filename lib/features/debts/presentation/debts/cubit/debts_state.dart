import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
abstract class DebtsState {}



class DebtsInitial extends DebtsState {}
class SetTraderIdState extends DebtsState {}
class SetPriceState extends DebtsState {}
class SetCurrencyState extends DebtsState {}
class SetDueDateState extends DebtsState {}

class PayDebtTraderLoadingState extends DebtsState {}
class PayDebtTraderLoadedState extends DebtsState {}
class PayDebtTraderErrorState extends DebtsState {
  final String message;
  PayDebtTraderErrorState(this.message);
}
class GetDebtInvoiceTraderLoadingState extends DebtsState {}
class GetDebtInvoiceTraderLoadedState extends DebtsState {}
class GetDebtInvoiceTraderErrorState extends DebtsState {
  final String message;
  GetDebtInvoiceTraderErrorState(this.message);
}

class GetDelegateDebtsLoadingState extends DebtsState {}

class GetDelegateDebtsErrorState extends DebtsState {
  final String message;
  GetDelegateDebtsErrorState(this.message);
}

class GetDelegateDebtsLoadedState extends DebtsState {}


class GetTraderDebtsLoadingState extends DebtsState {}

class GetTraderDebtsErrorState extends DebtsState {
  final String message;
  GetTraderDebtsErrorState(this.message);
}

class GetTraderDebtsLoadedState extends DebtsState {}

class CurrentOrdersExpanded extends DebtsState {}
class PreviousOrdersExpanded extends DebtsState {}


