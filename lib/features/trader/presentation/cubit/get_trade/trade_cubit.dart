import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/domain/usecase/active_trade_usecase.dart';
import 'package:mandoob/features/trader/domain/usecase/get_trade_usecase.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:meta/meta.dart';

part 'trade_state.dart';

class TradeCubit extends Cubit<TradeState> {
  static TradeCubit get(context) => BlocProvider.of(context);

  final GetTradesUseCase _tradesUseCase;
  final ActiveTradesUseCase _activeTradesUseCase;

  TradeCubit(this._tradesUseCase, this._activeTradesUseCase)
      : super(TradeInitial());

  String selectedTraderName = LocaleKeys.selectNewTrade.tr();

  TradeModel? model;

  void setTraderName(int id) {
    print("ID received: $id");

    var trade = model?.trades?.firstWhere(
      (tradeDataModel) => tradeDataModel.id == id,
    );

    if (trade != null) {
      selectedTraderName = trade.customerName;
      print("Selected Trader Name: ${trade.customerName}");
      emit(SelectTradeLoadedState());
    } else {
      print("No trade found with ID $id");
      selectedTraderName = "Trade not found";
      emit(SelectTradeLoadedState());
    }
  }

  void setTraderPurchaseName(int id) {
    print("ID received: $id");

    var trade = model?.trades?.firstWhere(
      (tradeDataModel) => tradeDataModel.id == id,
    );

    if (trade != null) {
      selectedTraderName = trade.customerName;
      print("Selected Trader Name: ${trade.customerName}");
      emit(SelectTradeLoadedState());
    } else {
      print("No trade found with ID $id");
      selectedTraderName = "Trade not found";
      emit(SelectTradeLoadedState());
    }
  }

  Future<void> getTrade() async {
    emit(GetTradeLoadingState());
    final result = await _tradesUseCase.execute("");
    result.fold((failure) => emit(GetTradeErrorState(failure.message)),
        (trades) {
      model = trades;
      emit(GetTradeLoadedState(model));
    });
  }

  void searchTrade(String query) {
    emit(SearchTradesLoadingState()); // حالة جديدة لبدء البحث
    if (query.isEmpty) {
      emit(SearchTradesSuccessState(
          model)); // إعادة إصدار البيانات الأصلية إذا كان الاستعلام فارغاً
      return;
    }

    // تصفية البيانات بناءً على الاستعلام
    final filteredTrades = model?.trades?.where((trade) {
          return trade.customerName
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              trade.phone.contains(query) ||
              trade.address.toLowerCase().contains(query) ||
              trade.priceAr.contains(query) ||
              trade.priceEn.toLowerCase().contains(query);
        }).toList() ??
        [];

    if (filteredTrades.isNotEmpty) {
      final resultModel = TradeModel(
        status: model?.status ?? false,
        message: "نتائج البحث",
        trades: filteredTrades,
      );
      print(resultModel.trades!.length);
      emit(SearchTradesSuccessState(resultModel));
    } else {
      emit(SearchTradesErrorState("لم يتم العثور على نتائج مطابقة"));
    }
  }

  Future<void> activeTrade(int traderId) async {
    emit(ActiveTradeLoadingState());
    final result = await _activeTradesUseCase.execute(traderId);
    result.fold((failure) => emit(ActiveTradeErrorState(failure.message)),
        (success) {
      emit(ActiveTradeLoadedState());
    });
  }

  Future<void> activePurchaseTrade(int traderId) async {
    emit(ActiveTradeLoadingState());
    final result = await _activeTradesUseCase.execute(traderId);
    result.fold((failure) => emit(ActiveTradeErrorState(failure.message)),
        (success) {
      emit(ActiveTradeLoadedState());
    });
  }
}
