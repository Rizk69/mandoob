import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

import '../../../../domain/model/company_products_model.dart';
import '../../../../domain/usecase/talabat_usecases.dart';

class NewTalabatCubit extends Cubit<NewTalabatState> {
  GetCompanyProductsUseCase _getCompanyProductsUseCase;
  AddTalabatUseCase _addTalabatUseCase;

  List<AddOrderRequest> addOrderRequest = [];

  NewTalabatCubit(this._getCompanyProductsUseCase, this._addTalabatUseCase)
      : super(NewTalabatLoading()) {
    addOrderRequest = [];
  }


  static NewTalabatCubit get(context) => BlocProvider.of(context);

  CompanyProductsModel? companyProductsModel;

  Map<int, int> productCounts = {};
  Map<int, UnitModel?> selectedUnits = {};
  UnitModel? getCurrentSelectedUnit() {
    return selectedUnits.isEmpty ? null : selectedUnits.values.firstOrNull!;
  }

  int? getCurrentProductCount() {
    return productCounts.isEmpty ? null : productCounts.values.firstOrNull!;
  }


  void increment(int productId) {
    productCounts[productId] = (productCounts[productId] ?? 0) + 1;
    emit(ProductCountChanged(productId, productCounts[productId]!));
  }

  void addOrderList(AddOrderRequest addOrder,BuildContext context) {
    int index = addOrderRequest
        .indexWhere((order) => order.product_id == addOrder.product_id);
    if (index != -1) {
      addOrderRequest[index] = addOrder;
      print("تم تحديث الطلب في القائمة");
    } else {
      addOrderRequest.add(addOrder);
      print("تمت إضافة الطلب إلى القائمة");
      final snackBar = defaultSnakeBar(
        title: LocaleKeys.SUCCESS.tr(),
        message: LocaleKeys.SUCCESS.tr(),
        state: ContentType.success,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    print(addOrderRequest);
  }

  void decrement(int productId) {
    if ((productCounts[productId] ?? 0) > 0) {
      productCounts[productId] = (productCounts[productId] ?? 0) - 1;
      emit(ProductCountChanged(productId, productCounts[productId]!));
    }
  }

  void changeUnit(int productId, UnitModel newUnit) {
    selectedUnits[productId] = newUnit;
    emit(ProductUnitChanged(productId, newUnit));
  }

  String? selectedProductName;

  void setSelectedProductName(String? name) {
    selectedProductName = name;
    emit(ProductFilterChanged(selectedProductName ?? ""));
  }

  void getCompanyProducts() async {
    emit(NewTalabatLoading());
    final result = await _getCompanyProductsUseCase.execute("");
    result.fold((failure) {
      emit(NewTalabatFailure(failure.message));
    }, (success) {
      companyProductsModel = success;
      emit(NewTalabatSuccess());
    });
  }
  void sendProducts(BuildContext context) async {
    if (addOrderRequest.isNotEmpty) {
      emit(AddTalabatLoading());
      final result = await _addTalabatUseCase.execute(addOrderRequest);
      result.fold((failure) {
        final snackBar = defaultSnakeBar(
          title: LocaleKeys.SUCCESS.tr(),
          message: LocaleKeys.SUCCESS.tr(),
          state: ContentType.success,
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        emit(AddTalabatFailure(failure.message));
      }, (success) {

        emit(AddTalabatSuccess());
      });
    } else {
      final snackBar = defaultSnakeBar(
        title: LocaleKeys.ERROR.tr(),
        message: LocaleKeys.ERROR.tr(),
        state: ContentType.failure,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      emit(AddTalabatFailure("No orders to send."));
    }
  }

}
