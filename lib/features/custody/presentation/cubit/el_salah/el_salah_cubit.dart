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
import 'package:meta/meta.dart';

part 'el_salah_state.dart';

class ElSalahCubit extends Cubit<ElSalahState> {
  ElSalahCubit(
      this._getCartUseCase,
      this._deleteProductInCartUseCase,
      this._deleteCartUseCase,
      this._confirmInvoiceUseCase,
      this._addCurrencyAndCountUseCase)
      : super(ElSalahInitial());

  static ElSalahCubit get(context) => BlocProvider.of(context);

  CartModel? cart;

  final GetCartUseCase _getCartUseCase;
  final DeleteProductInCartUseCase _deleteProductInCartUseCase;
  final DeleteCartUseCase _deleteCartUseCase;

  final ConfirmInvoiceUseCase _confirmInvoiceUseCase;
  final AddCurrencyAndCountUseCase _addCurrencyAndCountUseCase;

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
      emit(ConfirmInvoiceLoadedState());
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

  int countItems = 0;


  int selectedCurrency = 1;
  void updateCurrency(int currency) {
    print(currency);
    selectedCurrency = currency;
    emit(ElSalahCurrencyUpdated()); // تحديث الحالة
  }

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

  void expand() {
    isExpanded = !isExpanded;
    emit(ExpandedState());
  }
}
