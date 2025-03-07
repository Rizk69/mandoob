import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';

class GetTradesUseCase implements BaseUseCase<void, TradeModel> {
  final TradeRepository _tradeRepository;

  GetTradesUseCase(this._tradeRepository);

  @override
  Future<Either<Failure, TradeModel>> execute(void input) async {
    return await _tradeRepository.getTrades();
  }
}
