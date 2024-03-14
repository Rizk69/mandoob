
import 'package:dartz/dartz.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/repository/repository.dart';

import 'base_usecase.dart';

class EditColorProfileUseCase implements BaseUseCase<ColorProfile, void> {
  final Repository _repository;

  EditColorProfileUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(ColorProfile colorProfile) async {
    return await _repository.editColorProfile(colorProfile);
  }
}
