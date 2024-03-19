import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';
import 'package:mandoob/features/home/domain/model/home_model.dart';
import 'package:mandoob/features/home/domain/repository/home_repository.dart';

class EditPriceUseCase implements BaseUseCase<int, HomeModel> {
  final HomeRepository _homeRepository;

  EditPriceUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeModel>> execute(int price) async {
    return await _homeRepository.editShowPrice(price);
  }
}
