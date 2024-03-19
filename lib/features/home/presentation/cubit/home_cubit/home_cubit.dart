import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/home/domain/usecase/edit_price_usecases.dart';
import 'package:mandoob/features/home/domain/usecase/get_home_usecases.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeUseCase _getHomeUseCaseUseCase;
  final EditPriceUseCase _editPriceUseCase;

  HomeCubit(this._getHomeUseCaseUseCase, this._editPriceUseCase)
      : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int selectPrice = 0;
  num ? dolarPrice ;
  num ? tlPrice ;

  getHome() async {
    emit(GetHomeLoadingState());
    final result = await _getHomeUseCaseUseCase.execute("");
    result.fold((failure) => emit(GetHomeErrorState(failure.message)),
        (success) {
          dolarPrice = success.balance.totalDoler;
          tlPrice = success.balance.totalLera;
      emit(GetHomeLoadedState());
    });
  }


  editPrice(int price) async {
    emit(EditPriceLoadingState());

    selectPrice = price;

    final result = await _editPriceUseCase.execute(selectPrice);
    result.fold((failure) => emit(EditPriceErrorState(failure.message)),
            (success) {
          dolarPrice = success.balance.totalDoler;
          tlPrice = success.balance.totalLera;
          emit(EditPriceLoadedState());
        });
  }


}
