import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import '../repository/eahduh_repository.dart';

class PayPartialDeptUseCase
    implements BaseUseCase<PayPartialDeptRequest, void> {
  final EahduhRepository _eahduhRepository;

  PayPartialDeptUseCase(this._eahduhRepository);

  @override
  Future<Either<Failure, void>> execute(
      PayPartialDeptRequest partialDeptRequest) async {
    return await _eahduhRepository.payPartialDept(
        partialDeptRequest: partialDeptRequest);
  }
}
