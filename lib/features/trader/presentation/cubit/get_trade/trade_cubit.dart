import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/usecase/get_trade_usecase.dart';
import 'package:meta/meta.dart';

part 'trade_state.dart';

class TradeCubit extends Cubit<TradeState> {
  static TradeCubit get(context) => BlocProvider.of(context);

  final TradesUseCase _tradesUseCase;

  TradeCubit(this._tradesUseCase) : super(TradeInitial());

  TradeModel? model;

  Future<void> getTrade() async {
    emit(GetTradeLoadingState());
    final result = await _tradesUseCase.execute("");
    result.fold((failure) => emit(GetTradeErrorState(failure.message)),
        (trades) {
      model = trades;
      emit(GetTradeLoadedState());
    });
  }
}
