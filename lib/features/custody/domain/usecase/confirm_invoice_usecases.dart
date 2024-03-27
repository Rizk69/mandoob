import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/domain/model/confirm_model.dart';
import '../repository/eahduh_repository.dart';

class ConfirmInvoiceUseCase
    implements BaseUseCase<ConfirmRequest, ConfirmModel> {
  final EahduhRepository _eahduhRepository;

  ConfirmInvoiceUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, ConfirmModel>> execute(
      ConfirmRequest confirmRequest) async {
    return await _eahduhRepository.confirmInvoice(
        confirmRequest: confirmRequest);
  }
}
