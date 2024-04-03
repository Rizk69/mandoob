import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';
import 'package:mandoob/features/orders/domain/usecase/order_usecases.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this._getOrderDetailsUseCase,
    this._decreaseOrderUseCase,
    this._increaseOrderUseCase,
    this._deleteOrderUseCase,
  ) : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  GetOrderDetailsUseCase _getOrderDetailsUseCase;
  DecreaseOrderUseCase _decreaseOrderUseCase;
  IncreaseOrderUseCase _increaseOrderUseCase;
  DeleteOrderUseCase _deleteOrderUseCase;

  OrderDetailsModel? orders;

  void getOrder(int orderId) async {
    emit(GetOrderLoading()); // Emit loading state
    final result = await _getOrderDetailsUseCase.execute(orderId);
    result.fold((failure) => emit(GetOrderFailure(failure.message)),
        // Emit error state
        (model) {
      orders = model;
      emit(GetOrderSuccess());
    });
  }

  void deleteOrder(int orderId , int productId) async {
    emit(DeleteOrderLoading()); // Emit loading state
    final result = await _deleteOrderUseCase.execute(OrderRequest(product_id: productId.toString(),order_id: orderId.toString()));
    result.fold((failure) => emit(DeleteOrderFailure(failure.message)),
        (success) {
      emit(DeleteOrderSuccess(success.message));
    });
  }


  void increaseOrder(int orderId , int productId) async {
    emit(IncreaseCountLoading()); // Emit loading state
    final result = await _increaseOrderUseCase.execute(OrderRequest(product_id: productId.toString(),order_id: orderId.toString()));
    result.fold((failure) => emit(IncreaseCountFailure(failure.message)),
            (success) {
          emit(IncreaseCountSuccess(success.message));
        });
  }

  void decreaseOrder(int orderId , int productId) async {
    emit(DecreaseCountLoading()); // Emit loading state
    final result = await _decreaseOrderUseCase.execute(OrderRequest(product_id: productId.toString(),order_id: orderId.toString()));
    result.fold((failure) => emit(DecreaseCountFailure(failure.message)),
            (success) {
          emit(DecreaseCountSuccess(success.message));
        });
  }

}
