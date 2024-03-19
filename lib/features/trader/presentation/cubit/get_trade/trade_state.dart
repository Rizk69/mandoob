part of 'trade_cubit.dart';

@immutable
abstract class TradeState {}

class TradeInitial extends TradeState {}


class GetTradeLoadingState extends TradeState {}

class GetTradeLoadedState extends TradeState {}

class GetTradeErrorState extends TradeState {
  final String message;

  GetTradeErrorState(this.message);
}
