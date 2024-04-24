import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:mandoob/features/notification/domain/usecase/get_notification_usecases.dart';
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';
import 'package:mandoob/features/purchase/domain/usecase/add_purchase_usecases.dart';
import 'package:mandoob/features/purchase/domain/usecase/add_salse_purchase_usecases.dart';
import 'package:mandoob/features/purchase/domain/usecase/get_purchase_usecases.dart';
import 'package:meta/meta.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseCubit(this._getPurchaseUseCase, this._addPurchaseUseCase,
      this._addSalsePurchaseUseCase)
      : super(PurchaseInitial());

  static PurchaseCubit get(context) => BlocProvider.of(context);

  final GetPurchaseUseCase _getPurchaseUseCase;
  final AddPurchaseUseCase _addPurchaseUseCase;
  final AddSalsePurchaseUseCase _addSalsePurchaseUseCase;

  PurchaseModel? purchaseModel;
  AddPurchaseModel? addPurchaseModel;
  String productName='';
  String count='';
  String unit='';
  num currencyId=0;
  String price='';

  void setProductName(String newName) {
    productName = newName;
    emit(PurchaseNameChanged(productName));
  }

  void setCount(String newCount) {
    count = newCount;
    emit(PurchaseCountChanged(count));
  }

  void setCurrencyId(num newCurrencyId) {
    currencyId = newCurrencyId;
    emit(PurchaseCurrencyChanged(currencyId));
  }

  void setUnit(String newUnit) {
    unit = newUnit;
    emit(PurchaseUnitChanged(unit));
  }

  void setPrice(String newPrice) {
    price = newPrice;
    emit(PurchasePriceChanged(price));
  }

  Future<void> getPurchase() async {
    emit(GetPurchaseLoadingState());
    final result = await _getPurchaseUseCase.execute('');
    result.fold((failure) => emit(GetPurchaseErrorState(failure.message)),
        (success) {
      purchaseModel = success;
      emit(GetPurchaseSuccessState());
    });
  }

  Future<void> addPurchase() async {
    emit(AddPurchaseLoadingState());
    final result = await _addPurchaseUseCase.execute(AddPurchaseRequest(
        price: price,
        currencyId: currencyId.toString(),
        count: count,
        unit: unit,
        productName: productName));
    result.fold((failure) => emit(AddPurchaseErrorState(failure.message)),
        (success) {
      addPurchaseModel = success;
      emit(AddPurchaseSuccessState());
    });
  }
}
