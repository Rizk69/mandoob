import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';
import 'package:mandoob/features/trafiic_lines/domain/repository/traffic_line_repository.dart';

class CloseDeliveryLineUseCase implements BaseUseCase<int, void> {
  final Repository _repository;

  CloseDeliveryLineUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(int id) async {
    return await _repository.closeDelivaryLine(id: id);
  }
}
