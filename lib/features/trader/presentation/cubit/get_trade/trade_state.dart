part of 'trade_cubit.dart';

@immutable
abstract class TradeState {}

class TradeInitial extends TradeState {}


class SearchTradesLoadingState extends TradeState {}
class SearchTradesSuccessState extends TradeState {
  final TradeModel? model;

  SearchTradesSuccessState(this.model);
}
class SearchTradesErrorState extends TradeState {
  final String message;

  SearchTradesErrorState(this.message);
}



class GetTradeLoadingState extends TradeState {}

class GetTradeLoadedState extends TradeState {
  final TradeModel? model;

  GetTradeLoadedState(this.model);
}

class GetTradeErrorState extends TradeState {
  final String message;

  GetTradeErrorState(this.message);
}




class ActiveTradeLoadingState extends TradeState {}

class ActiveTradeLoadedState extends TradeState {}

class ActiveTradeErrorState extends TradeState {
  final String message;

  ActiveTradeErrorState(this.message);
}


class SelectTradeLoadedState extends TradeState {}
