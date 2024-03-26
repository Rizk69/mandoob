import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/custody/domain/usecase/add_to_cart_usecases.dart';
import '../../../domain/model/eahduh_order_model.dart';
import '../../../domain/usecase/eahduh_usecases.dart';

part 'eahduh_state.dart';

class EahduhCubit extends Cubit<EahduhState> {
  EahduhCubit(this._eahduhUseCase,this._addProductToCartUseCase) : super(EahduhInitial());

  static EahduhCubit get(context) => BlocProvider.of(context);

  EahduhOrderModel? orderModel;
  final EahduhUseCase _eahduhUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;

  getEahduhOrder() async {
    emit(GetEahduhLoadingState());
    final result = await _eahduhUseCase.execute('');
    result.fold((failure) => emit(GetEahduhErrorState(failure.message)),
        (success) {
      orderModel = success;
      emit(GetEahduhLoadedState());
    });
  }

  Future<void> addFavorite({required int id}) async {
    emit(AddEahduhLoadingState());
    final result = await _eahduhUseCase.addEahduhOrder(id: id);
    result.fold(
      (failure) {
        print(failure);
        emit(AddEahduhErrorState(failure.message));
      },
      (success) async {
        print('success Add');
        emit(AddEahduhSuccessState());
        await Future.delayed(Duration(milliseconds: 100));
        getEahduhOrder();
      },
    );
  }

  Future<void> deleteFavorite({required int id}) async {
    emit(DeleteEahduhLoadingState());
    final result = await _eahduhUseCase.deleteEahduhOrder(id: id);
    result.fold(
      (failure) {
        print(failure);
        emit(DeleteEahduhErrorState(failure.message));
      },
      (success) async {
        print('success Delete');
        emit(DeleteEahduhSuccessState());
        await Future.delayed(Duration(milliseconds: 100));
        getEahduhOrder();
      },
    );
  }


  addProductToCart(int id) async {
    emit(AddProductToCartLoadingState());
    final result = await _addProductToCartUseCase.execute(id);
    result.fold((failure) => emit(AddProductToCartErrorState(failure.message)), (model) {
      emit(AddProductToCartSuccessState());
    });
  }
}
