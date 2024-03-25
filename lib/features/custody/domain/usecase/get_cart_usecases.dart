import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import '../repository/eahduh_repository.dart';

class GetCartUseCase implements BaseUseCase<void, CartModel> {
  final EahduhRepository _eahduhRepository;

  GetCartUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, CartModel>> execute(void input) async {
    return await _eahduhRepository.getCart();
  }
}
