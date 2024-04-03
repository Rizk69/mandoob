import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/domain/model/add_order_model.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';

import '../model/company_products_model.dart';
import '../repository/talabat_repository.dart';

class GetOldTalabatUseCase implements BaseUseCase<void, TalabatModel> {
  final TalabatRepository _talabatRepository;

  GetOldTalabatUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, TalabatModel>> execute(_) async {
    return await _talabatRepository.getOldOrders();
  }
}

class GetPresentTalabatUseCase implements BaseUseCase<void, TalabatModel> {
  final TalabatRepository _talabatRepository;

  GetPresentTalabatUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, TalabatModel>> execute(_) async {
    return await _talabatRepository.getPresentOrders();
  }
}

class GetCompanyProductsUseCase
    implements BaseUseCase<void, CompanyProductsModel> {
  final TalabatRepository _talabatRepository;

  GetCompanyProductsUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, CompanyProductsModel>> execute(_) async {
    return await _talabatRepository.getCompanyProducts();
  }
}

class AddTalabatUseCase
    implements BaseUseCase<List<AddOrderRequest>, AddOrderModel> {
  final TalabatRepository _talabatRepository;

  AddTalabatUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, AddOrderModel>> execute(
      List<AddOrderRequest> orders) async {
    return await _talabatRepository.addTalabat(orders);
  }
}
