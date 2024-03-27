import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import '../repository/eahduh_repository.dart';

class AddCurrencyAndCountUseCase
    implements BaseUseCase<AddCurrencyAndCountRequest, void> {
  final EahduhRepository _eahduhRepository;

  AddCurrencyAndCountUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, void>> execute(
      AddCurrencyAndCountRequest addCurrencyAndCountRequest) async {
    return await _eahduhRepository.addCurrencyAndCount(
        product_id: addCurrencyAndCountRequest.product_id!,
        count: addCurrencyAndCountRequest.count!,
        currency_id: addCurrencyAndCountRequest.currency_id!);
  }
}
