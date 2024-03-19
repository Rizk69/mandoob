part of 'add_trade_cubit.dart';

@immutable
abstract class AddTradeState {}

class AddTradeInitial extends AddTradeState {}


class AddTradeLoadingState extends AddTradeState {}

class AddTradeLoadedState extends AddTradeState {
  final String message;

  AddTradeLoadedState(this.message);
}

class AddTradeErrorState extends AddTradeState {
  final String message;

  AddTradeErrorState(this.message);
}



class SetTradeNameState extends AddTradeState {}
class SetTradeAddressState extends AddTradeState {}
class SetTradePhoneState extends AddTradeState {}
class SetTradePriceState extends AddTradeState {}