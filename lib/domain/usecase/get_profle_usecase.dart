import 'package:dartz/dartz.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/responses/profile/user_response.dart';
import 'package:mandoob/domain/repository/repository.dart';

import '../model/user/UserModel.dart';

class ProfileUseCase  {
  final Repository _repository;

  ProfileUseCase(this._repository);

  Future<Either<Failure, UserModel>> execute() async {
    return await _repository.getProfile();
  }
}
