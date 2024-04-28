part of 'purchase_cubit.dart';

@immutable
abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}


class GetPurchaseLoadingState extends PurchaseState {}
class GetPurchaseSuccessState extends PurchaseState {}
class GetPurchaseErrorState extends PurchaseState {
  final String error ;

  GetPurchaseErrorState(this.error);
}class AddPurchaseLoadingState extends PurchaseState {}
class AddPurchaseSuccessState extends PurchaseState {}
class AddPurchaseErrorState extends PurchaseState {
  final String error ;

  AddPurchaseErrorState(this.error);
}
class PurchaseNameChanged extends PurchaseState {
  final String productName;
  PurchaseNameChanged(this.productName);
}

class PurchaseCountChanged extends PurchaseState {
  final String count;
  PurchaseCountChanged(this.count);
}

class PurchaseCurrencyChanged extends PurchaseState {
  final num currencyId;
  PurchaseCurrencyChanged(this.currencyId);
}

class PurchaseUnitChanged extends PurchaseState {
  final String unit;
  PurchaseUnitChanged(this.unit);
}

class PurchasePriceChanged extends PurchaseState {
  final String price;
  PurchasePriceChanged(this.price);
}