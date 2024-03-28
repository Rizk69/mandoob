import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';

import '../repository/talabat_repository.dart';

class GetOldTalabatUseCase implements BaseUseCase<void, TalabatModel> {
  final TalabatRepository _talabatRepository;

  GetOldTalabatUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, TalabatModel>> execute(_) async {
    return await _talabatRepository.getOldOrders();
  }
}

class GetPresentTalabatUseCase implements BaseUseCase<void, TalabatModel> {
  final TalabatRepository _talabatRepository;

  GetPresentTalabatUseCase(this._talabatRepository);

  @override
  Future<Either<Failure, TalabatModel>> execute(_) async {
    return await _talabatRepository.getPresentOrders();
  }
}
