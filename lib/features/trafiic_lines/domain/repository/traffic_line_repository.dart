import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';



abstract class Repository {
  Future<Either<Failure, TrafficModel>> getDelivaryLine();
}
