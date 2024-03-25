import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';

class ActiveTradesUseCase implements BaseUseCase<int, void> {
  final TradeRepository _tradeRepository;

  ActiveTradesUseCase(this._tradeRepository);

  @override
  Future<Either<Failure, void>> execute(int traderId) async {
    return await _tradeRepository.activeTrades(traderId);
  }
}
