import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/eahduh_order_model.dart';
import '../../domain/usecase/eahduh_usecases.dart';

part 'eahduh_state.dart';

class EahduhCubit extends Cubit<EahduhState> {
  EahduhCubit(this._eahduhUseCase) : super(EahduhInitial());
  static EahduhCubit get(context) => BlocProvider.of(context);

  EahduhOrderModel? orderModel;
  final EahduhUseCase _eahduhUseCase;

  getEahduhOrder() async {
    emit(GetEahduhLoadingState());
    final result = await _eahduhUseCase.execute('');
    result.fold((failure) => emit(GetEahduhErrorState(failure.message)),
        (success) {
      orderModel = success;
      emit(GetEahduhLoadedState());
    });
  }
}
