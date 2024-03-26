import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/usecase/get_cart_usecases.dart';
import 'package:meta/meta.dart';

part 'el_salah_state.dart';

class ElSalahCubit extends Cubit<ElSalahState> {
  ElSalahCubit(this._getCartUseCase) : super(ElSalahInitial());

  static ElSalahCubit get(context) => BlocProvider.of(context);

  CartModel? cart;

  final GetCartUseCase _getCartUseCase;

  getCartOrder() async {
    emit(GetCartLoadingState());
    final result = await _getCartUseCase.execute('');
    result.fold((failure) => emit(GetCartErrorState(failure.message)), (model) {
      cart = model;
      emit(GetCartLoadedState());
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
}
