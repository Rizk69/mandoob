import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';
import 'package:mandoob/features/home/domain/model/home_model.dart';
import 'package:mandoob/features/home/domain/repository/home_repository.dart';

class GetHomeUseCase implements BaseUseCase<void, HomeModel> {
  final HomeRepository _homeRepository;

  GetHomeUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeModel>> execute(void input) async {
    return await _homeRepository.getHome();
  }
}
