import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_state.dart';

import '../../../../domain/model/company_products_model.dart';
import '../../../../domain/usecase/talabat_usecases.dart';


class NewTalabatCubit extends Cubit<NewTalabatState> {
  GetCompanyProductsUseCase _getCompanyProductsUseCase;

  NewTalabatCubit(
    this._getCompanyProductsUseCase,
  ) : super(NewTalabatLoading());

  static NewTalabatCubit get(context) => BlocProvider.of(context);


  CompanyProductsModel? companyProductsModel;


  Map<int, int> productCounts ={};
  Map<int, UnitModel?> selectedUnits = {};

  void increment(int productId) {
    productCounts[productId] = (productCounts[productId] ?? 0) + 1;
    emit(ProductCountChanged(productId, productCounts[productId]!));
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
    emit(ProductFilterChanged(selectedProductName??"")); // قد تحتاج إلى إنشاء هذه الحالة
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
}
