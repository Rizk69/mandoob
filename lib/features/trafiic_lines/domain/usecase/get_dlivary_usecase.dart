import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';
import 'package:mandoob/features/trafiic_lines/domain/repository/traffic_line_repository.dart';

class DelivaryLineUseCase implements BaseUseCase<void, TrafficModel> {
  final Repository _repository;

  DelivaryLineUseCase(this._repository);

  @override
  Future<Either<Failure, TrafficModel>> execute(void input) async {
    return await _repository.getDelivaryLine();
  }
}
