import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trafiic_lines/data/network/add_requests.dart';
import 'package:mandoob/features/trafiic_lines/data/network/search_requests.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';



abstract class Repository {
  Future<Either<Failure, TrafficModel>> getDelivaryLine();
  Future<Either<Failure, void>> deleteDelivaryLine({required int id});
  Future<Either<Failure, void>> closeDelivaryLine({required int id});
  Future<Either<Failure, TrafficModel>> searchDelivaryLine({required SearchLineRequest searchLineRequest});

  Future<Either<Failure, void>> addDelivaryLine({required AddLineRequest addLineRequest});
}
