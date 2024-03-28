part of 'el_salah_cubit.dart';

@immutable
abstract class ElSalahState {}

class ElSalahInitial extends ElSalahState {}

class GetCartLoadingState extends ElSalahState {}

class GetCartLoadedState extends ElSalahState {}

class GetCartErrorState extends ElSalahState {
  final String message;

  GetCartErrorState(this.message);
}

class DeleteCartLoadingState extends ElSalahState {}

class DeleteCartLoadedState extends ElSalahState {}

class DeleteCartErrorState extends ElSalahState {
  final String message;

  DeleteCartErrorState(this.message);
}

class DeleteOneProductCartLoadingState extends ElSalahState {}

class DeleteOneProductCartLoadedState extends ElSalahState {}

class DeleteOneProductCartErrorState extends ElSalahState {
  final String message;

  DeleteOneProductCartErrorState(this.message);
}

class ConfirmInvoiceLoadingState extends ElSalahState {}

class ConfirmCashInvoiceLoadedState extends ElSalahState {
  final ConfirmModel model;

  ConfirmCashInvoiceLoadedState(this.model);
}

class ConfirmDeptInvoiceLoadedState extends ElSalahState {
  final ConfirmModel model;

  ConfirmDeptInvoiceLoadedState(this.model);
}

class ConfirmInvoiceErrorState extends ElSalahState {
  final String message;

  ConfirmInvoiceErrorState(this.message);
}

class AddCurrencyAndCountLoadingState extends ElSalahState {}

class AddCurrencyAndCountLoadedState extends ElSalahState {}

class AddCurrencyAndCountErrorState extends ElSalahState {
  final String message;

  AddCurrencyAndCountErrorState(this.message);
}


class PayPartialDeptLoadingState extends ElSalahState {}

class PayPartialDeptLoadedState extends ElSalahState {}

class PayPartialDeptErrorState extends ElSalahState {
  final String message;

  PayPartialDeptErrorState(this.message);
}



class YourInitialState extends ElSalahState {}

class YourItemAddedState extends ElSalahState {}

class YourItemRemovedState extends ElSalahState {}

class ExpandedState extends ElSalahState {}

class ElSalahCurrencyUpdated extends ElSalahState {}
