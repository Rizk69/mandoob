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
      emit(GetTradeLoadedState(model));
    });
  }


  void searchTrade(String query) {
    emit(SearchTradesLoadingState()); // حالة جديدة لبدء البحث
    if (query.isEmpty) {
      emit(SearchTradesSuccessState(model)); // إعادة إصدار البيانات الأصلية إذا كان الاستعلام فارغاً
      return;
    }

    // تصفية البيانات بناءً على الاستعلام
    final filteredTrades = model?.trades?.where((trade) {
      return trade.customerName.toLowerCase().contains(query.toLowerCase()) ||
          trade.phone.contains(query);
    }).toList() ?? [];

    if (filteredTrades.isNotEmpty) {
      // إنشاء نموذج جديد بالنتائج المصفاة
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



// Future<void> getTrade({String searchQuery = ""}) async {
  //   emit(GetTradeLoadingState());
  //   final result = await _tradesUseCase.execute("");
  //   result.fold((failure) => emit(GetTradeErrorState(failure.message)), (trades) {
  //     if (searchQuery.isNotEmpty) {
  //       // تصفية النتائج بناءً على الاستعلام
  //       var filteredTrades = trades.trades?.where((trade) {
  //         return trade.customerName.toLowerCase().contains(searchQuery.toLowerCase()) ||
  //             trade.phone.contains(searchQuery);
  //       }).toList();
  //
  //       // إنشاء نموذج جديد بالنتائج المصفاة
  //       model = TradeModel(
  //         status: trades.status,
  //         message: trades.message,
  //         trades: filteredTrades,
  //       );
  //     } else {
  //       model = trades;
  //     }
  //     emit(GetTradeLoadedState());
  //   });
  // }

}
