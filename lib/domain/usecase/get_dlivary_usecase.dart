import 'package:dartz/dartz.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/domain/model/profile/user_model.dart';
import 'package:mandoob/domain/repository/repository.dart';

import 'base_usecase.dart';

class DelivaryLineUseCase implements BaseUseCase<void, UserModel> {
  final Repository _repository;

  DelivaryLineUseCase(this._repository);

  @override
  Future<Either<Failure, UserModel>> execute(void input) async {
    return await _repository.getDelivaryLine();
  }
}
