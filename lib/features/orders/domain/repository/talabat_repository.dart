import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';


import '../model/talabat_model.dart';

abstract class TalabatRepository {

  Future<Either<Failure, TalabatModel>> getPresentOrders();
  Future<Either<Failure, TalabatModel>> getOldOrders();
}
