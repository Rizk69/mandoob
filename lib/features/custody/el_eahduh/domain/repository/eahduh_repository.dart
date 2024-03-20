import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';

import '../model/eahduh_order_model.dart';



abstract class EahduhRepository {
  Future<Either<Failure, EahduhOrderModel>> getEahduhOrder();
}
