import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import '../repository/eahduh_repository.dart';

class DeleteProductInCartUseCase implements BaseUseCase<int, void> {
  final EahduhRepository _eahduhRepository;

  DeleteProductInCartUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, void>> execute(int productId) async {
    return await _eahduhRepository.deleteOneProductInCart(productId: productId);
  }
}
