import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/trafiic_lines/data/network/search_requests.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';
import 'package:mandoob/features/trafiic_lines/domain/repository/traffic_line_repository.dart';

class SearchDeliveryLineUseCase implements BaseUseCase<SearchLineRequest, TrafficModel> {
  final Repository _repository;

  SearchDeliveryLineUseCase(this._repository);

  @override
  Future<Either<Failure, TrafficModel>> execute(SearchLineRequest searchLineRequest) async {
    return await _repository.searchDelivaryLine(searchLineRequest: searchLineRequest);
  }
}
