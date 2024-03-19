import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/common/freezed_data_class.dart';
import 'package:mandoob/features/trader/data/network/trade_requests.dart';
import 'package:mandoob/features/trader/domain/usecase/add_trade_usecase.dart';
import 'package:meta/meta.dart';

part 'add_trade_state.dart';

class AddTradeCubit extends Cubit<AddTradeState> {
  final AddTradesUseCase _addTradesUseCase;


  AddTradeCubit(this._addTradesUseCase) : super(AddTradeInitial());

  var tradeObject = TraderObject("", "","",0);

  static AddTradeCubit get(context) => BlocProvider.of(context);




  setName(String name){
    tradeObject = tradeObject.copyWith(name: name);
    emit(SetTradeNameState());
  }

  setAddress(String address){
    tradeObject = tradeObject.copyWith(address: address);
    emit(SetTradeAddressState());
  }

  setPhone(String phone){
    tradeObject = tradeObject.copyWith(phone: phone);
    emit(SetTradePhoneState());
  }

  setPrice(int price){
    tradeObject = tradeObject.copyWith(price: price) ;
    emit(SetTradePriceState());

  }


  addTrade() async {
    print(tradeObject);

    emit(AddTradeLoadingState());
    final result = await _addTradesUseCase.execute(TradeRequest(
      price: tradeObject.price,
      name:  tradeObject.name,
      address: tradeObject.address,
      phone: tradeObject.phone,
    ));
    result.fold((failure) => emit(AddTradeErrorState(failure.message)),
            (success) {
          emit(AddTradeLoadedState(success.message));
        });

  }


}
