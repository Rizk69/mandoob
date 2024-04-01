import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/company_products_model.dart';
import '../../../domain/usecase/talabat_usecases.dart';

abstract class NewTalabatState {}

class NewTalabatLoading extends NewTalabatState {}

class Add extends NewTalabatState {}

class Increase extends NewTalabatState {}

class NewTalabatSuccess extends NewTalabatState {}

class NewTalabatFailure extends NewTalabatState {
  final String massage;

  NewTalabatFailure(this.massage);
}

class NewTalabatCubit extends Cubit<NewTalabatState> {
  GetCompanyProductsUseCase _getCompanyProductsUseCase;

  NewTalabatCubit(
    this._getCompanyProductsUseCase,
  ) : super(NewTalabatLoading());

  static NewTalabatCubit get(context) => BlocProvider.of(context);

  int count = 0;

  CompanyProductsModel? companyProductsModel;

  void increment() {
    count++;
    emit(Add());
  }

  void decrement() {
    if (count > 0) {
      count--;
      emit(Increase());
    }
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
