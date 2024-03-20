import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import '../model/eahduh_order_model.dart';
import '../repository/eahduh_repository.dart';

class EahduhUseCase implements BaseUseCase<void, EahduhOrderModel> {
  final EahduhRepository _eahduhRepository;

  EahduhUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, EahduhOrderModel>> execute(void input) async {
    return await _eahduhRepository.getEahduhOrder();
  }
}
