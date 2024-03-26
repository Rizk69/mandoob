import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/usecase/delete_all_product_in_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/delete_product_in_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/get_cart_usecases.dart';
import 'package:meta/meta.dart';

part 'el_salah_state.dart';

class ElSalahCubit extends Cubit<ElSalahState> {
  ElSalahCubit(
    this._getCartUseCase,
    this._deleteProductInCartUseCase,
    this._deleteCartUseCase,
  ) : super(ElSalahInitial());

  static ElSalahCubit get(context) => BlocProvider.of(context);

  CartModel? cart;

  final GetCartUseCase _getCartUseCase;
  final DeleteProductInCartUseCase _deleteProductInCartUseCase;
  final DeleteCartUseCase _deleteCartUseCase;

  getCartOrder() async {
    emit(GetCartLoadingState());
    final result = await _getCartUseCase.execute('');
    result.fold((failure) => emit(GetCartErrorState(failure.message)), (model) {
      cart = model;
      emit(GetCartLoadedState());
    });
  }

  deleteCart() async {
    emit(DeleteCartLoadingState());
    final result = await _deleteCartUseCase.execute('');
    result.fold((failure) => emit(DeleteCartErrorState(failure.message)),
        (model) {
      emit(DeleteCartLoadedState());
    });
  }

  deleteOneProductInCart(int productId) async {
    emit(DeleteOneProductCartLoadingState());
    final result = await _deleteProductInCartUseCase.execute(productId);
    result.fold(
        (failure) => emit(DeleteOneProductCartErrorState(failure.message)),
        (model) {
      emit(DeleteOneProductCartLoadedState());

    });
  }

  int countItems = 0;

  void addItem() {
    countItems++;
    emit(YourItemAddedState());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void removeItem() {
    if (countItems != 0) {
      countItems--;
    }

    emit(YourItemRemovedState());
  }


  bool isExpanded = false;

  void expand(){
    isExpanded = !isExpanded;
    emit(ExpandedState());
  }
}
