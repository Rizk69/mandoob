import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';

class EditColorProfileUseCase implements BaseUseCase<ColorProfile, void> {
  final AuthRepository _authRepository;

  EditColorProfileUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> execute(ColorProfile colorProfile) async {
    return await _authRepository.editColorProfile(colorProfile);
  }
}
