import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/domain/model/add_order_model.dart';
import 'package:mandoob/features/orders/domain/model/company_products_model.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';


import '../model/talabat_model.dart';

abstract class TalabatRepository {

  Future<Either<Failure, TalabatModel>> getPresentOrders();
  Future<Either<Failure, TalabatModel>> getOldOrders();
  Future<Either<Failure, CompanyProductsModel>> getCompanyProducts();



  Future<Either<Failure, AddOrderModel>> addTalabat(List<AddOrderRequest> orders);
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(int orderId);
  Future<Either<Failure, AddOrderModel>> decreaseOrder(OrderRequest orderRequest);
  Future<Either<Failure, AddOrderModel>> increaseOrder(OrderRequest orderRequest);
  Future<Either<Failure, AddOrderModel>> deleteOrder(OrderRequest orderRequest);
}
