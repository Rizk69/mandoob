import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/model/confirm_model.dart';
import 'package:mandoob/features/custody/domain/usecase/add_currency_and_count_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/confirm_invoice_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/delete_all_product_in_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/delete_product_in_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/get_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/pay_partial_dept_usecases.dart';
import 'package:meta/meta.dart';

part 'el_salah_state.dart';

class ElSalahCubit extends Cubit<ElSalahState> {
  ElSalahCubit(
      this._getCartUseCase,
      this._deleteProductInCartUseCase,
      this._deleteCartUseCase,
      this._confirmInvoiceUseCase,
      this._payPartialDeptUseCase,
      this._addCurrencyAndCountUseCase)
      : super(ElSalahInitial());

  static ElSalahCubit get(context) => BlocProvider.of(context);

  CartModel? cart;

  final GetCartUseCase _getCartUseCase;
  final DeleteProductInCartUseCase _deleteProductInCartUseCase;
  final DeleteCartUseCase _deleteCartUseCase;

  final ConfirmInvoiceUseCase _confirmInvoiceUseCase;
  final AddCurrencyAndCountUseCase _addCurrencyAndCountUseCase;
  final PayPartialDeptUseCase _payPartialDeptUseCase;

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

  ConfirmModel? confirmModel;

  confirmInvoice(int pay) async {
    emit(ConfirmInvoiceLoadingState());
    final result = await _confirmInvoiceUseCase.execute(ConfirmRequest(
      pay: pay,
    ));
    result.fold((failure) => emit(ConfirmInvoiceErrorState(failure.message)),
        (model) {
      confirmModel = model;

      if (pay ==0){
        emit(ConfirmCashInvoiceLoadedState(model));

      }else {
        emit(ConfirmDeptInvoiceLoadedState(model));

      }

    });
  }

  addCurrencyAndCount(
      {required int product_id,
      required int currency_id,
      required num count}) async {
    emit(AddCurrencyAndCountLoadingState());
    final result =
        await _addCurrencyAndCountUseCase.execute(AddCurrencyAndCountRequest(
      currency_id: currency_id,
      count: count,
      product_id: product_id,
    ));
    result.fold(
      (failure) => emit(AddCurrencyAndCountErrorState(failure.message)),
      (model) => emit(AddCurrencyAndCountLoadedState()),
    );
  }

  payPartialDept({required PayPartialDeptRequest partialDeptRequest}) async {
    emit(PayPartialDeptLoadingState());
    final result =
    await _payPartialDeptUseCase.execute(partialDeptRequest);
    result.fold(
          (failure) => emit(PayPartialDeptErrorState(failure.message)),
          (model) => emit(PayPartialDeptLoadedState()),
    );
  }


  int selectedCurrency = 1;
  void updateCurrency(int currency) {
    print(currency);
    selectedCurrency = currency;
    emit(ElSalahCurrencyUpdated());
  }


  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }



  Map<int, int> itemsCountPerProduct = {};


  void addItem(int productId) {
    if (itemsCountPerProduct.containsKey(productId)) {
      itemsCountPerProduct[productId] = itemsCountPerProduct[productId]! + 1;
    } else {
      itemsCountPerProduct[productId] = 1;
    }
    emit(YourItemAddedState());
  }

  void removeItem(int productId) {
    if (itemsCountPerProduct.containsKey(productId) && itemsCountPerProduct[productId]! > 0) {
      itemsCountPerProduct[productId] = itemsCountPerProduct[productId]! - 1;
    }
    emit(YourItemRemovedState());
  }


  bool isExpanded = false;

  void expand() {
    isExpanded = !isExpanded;
    emit(ExpandedState());
  }


  int? expandedProductId;
  void toggleExpanded(int productId) {
    expandedProductId = (expandedProductId == productId) ? null : productId;
    emit(ExpandedState());
  }

int ? invoiceId ;
num ? pay_Doler ;
num ? pay_Lera ;

setPayDoler(num payDolar){
  pay_Doler= payDolar;
  emit(SetPayDolarState());
}
setPayLera(num payLera){
  pay_Lera = payLera;
  emit(SetPayLeraState());

}

}
