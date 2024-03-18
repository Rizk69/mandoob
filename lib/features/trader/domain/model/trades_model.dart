import 'package:mandoob/features/trader/domain/model/trades_data_model.dart';

class TradeModel {
  bool status;
  String message;
  List<TradeDataModel> trades;

  TradeModel({
    required this.status,
    required this.message,
    required this.trades,
  });

}

