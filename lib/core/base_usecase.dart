import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
