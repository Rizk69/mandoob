import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/talabat_cubit/talabat_state.dart';

import '../../../../domain/usecase/talabat_usecases.dart';

class TalabatViewCubit extends Cubit<TalabatViewState> {
  final GetOldTalabatUseCase _getOldTalabatUseCase;
  final GetPresentTalabatUseCase _getPresentTalabatUseCase;

  TalabatViewCubit(this._getOldTalabatUseCase, this._getPresentTalabatUseCase)
      : super(OrderInitialStateState());

  static TalabatViewCubit get(context) => BlocProvider.of<TalabatViewCubit>(context);

  void toggleCurrentOrdersExpansion() {
    emit(CurrentOrdersExpandedState());
  }

  void togglePreviousOrdersExpansion() {
    emit(PreviousOrdersExpandedState());
  }

  TalabatModel? talabatOldModel;
  TalabatModel? talabatPresentModel;

  void getOldTalabat() async {
    emit(LoadingOldState());
    final result = await _getOldTalabatUseCase.execute("");
    result.fold(
          (failure) => emit(ErrorOldState(failure.toString())),
          (success) {
            talabatOldModel = success;
            filteredOldOrders = List.from(success.orders);

            emit(LoadedOldState(success));
          },
    );
  }

  void getPresentTalabat() async {
    emit(LoadingPresentState());
    final result = await _getPresentTalabatUseCase.execute("");
    result.fold(
          (failure) => emit(ErrorPresentState(failure.toString())),
          (success) {
            talabatPresentModel = success;
            filteredPresentOrders = List.from(success.orders);

            emit(LoadedPresentState(success));
          },
    );
  }

  List<OrdersTalabat> filteredPresentOrders = [];
  List<OrdersTalabat> filteredOldOrders = [];

  void searchTalabat(String query) {
    // If the query is empty, use the full list
    if (query.isEmpty) {
      filteredPresentOrders = List.from(talabatPresentModel!.orders);
      filteredOldOrders = List.from(talabatOldModel!.orders);
    } else {
      // Filter based on the date or other fields
      filteredPresentOrders = talabatPresentModel!.orders
          .where((order) => order.date == query ||
          order.orderNo.contains(query) ||
          order.status_ar.toString().contains(query) ||
          order.status_en.toString().contains(query))
          .toList();

      filteredOldOrders = talabatOldModel!.orders
          .where((order) => order.date == query ||
          order.orderNo.contains(query) ||
          order.status_ar.toString().contains(query) ||
          order.status_en.toString().contains(query))
          .toList();
    }

    emit(LoadedPresentState(talabatPresentModel!.copyWith(orders: filteredPresentOrders)));
    emit(LoadedOldState(talabatOldModel!.copyWith(orders: filteredOldOrders)));
  }




}
