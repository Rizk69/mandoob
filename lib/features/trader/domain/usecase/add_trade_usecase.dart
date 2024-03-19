import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trader/data/network/trade_requests.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';

class AddTradesUseCase implements BaseUseCase<TradeRequest, TradeModel> {
  final TradeRepository _tradeRepository;

  AddTradesUseCase(this._tradeRepository);

  @override
  Future<Either<Failure, TradeModel>> execute(TradeRequest tradeRequest) async {
    return await _tradeRepository.addTrades(tradeRequest);
  }
}
