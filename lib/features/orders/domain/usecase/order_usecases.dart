import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/domain/model/add_order_model.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';

import '../repository/talabat_repository.dart';

class GetOrderDetailsUseCase implements BaseUseCase<int, OrderDetailsModel> {
  final TalabatRepository _talabatRepository;

  GetOrderDetailsUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, OrderDetailsModel>> execute(int orderId) async {
    return await _talabatRepository.getOrderDetails(orderId);
  }
}

class DecreaseOrderUseCase implements BaseUseCase<OrderRequest, AddOrderModel> {
  final TalabatRepository _talabatRepository;

  DecreaseOrderUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, AddOrderModel>> execute(
      OrderRequest orderRequest) async {
    return await _talabatRepository.decreaseOrder(orderRequest);
  }
}

class IncreaseOrderUseCase implements BaseUseCase<OrderRequest, AddOrderModel> {
  final TalabatRepository _talabatRepository;

  IncreaseOrderUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, AddOrderModel>> execute(
      OrderRequest orderRequest) async {
    return await _talabatRepository.increaseOrder(orderRequest);
  }
}

class DeleteOrderUseCase implements BaseUseCase<OrderRequest, AddOrderModel> {
  final TalabatRepository _talabatRepository;

  DeleteOrderUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, AddOrderModel>> execute(
      OrderRequest orderRequest) async {
    return await _talabatRepository.deleteOrder(orderRequest);
  }
}
