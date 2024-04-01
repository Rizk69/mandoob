import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/orders/domain/model/company_products_model.dart';


import '../model/talabat_model.dart';

abstract class TalabatRepository {

  Future<Either<Failure, TalabatModel>> getPresentOrders();
  Future<Either<Failure, TalabatModel>> getOldOrders();
  Future<Either<Failure, CompanyProductsModel>> getCompanyProducts();
  Future<Either<Failure, CompanyProductsModel>> addTalabat();
}
