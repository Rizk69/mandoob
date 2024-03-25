import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trader/data/network/trade_requests.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';

abstract class TradeRepository {

  Future<Either<Failure, TradeModel>> getTrades();

  Future<Either<Failure, TradeModel>> addTrades(TradeRequest tradeRequest);

  Future<Either<Failure, void>> activeTrades(int traderId);

}
