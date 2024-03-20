import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/model/profile/user_model.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';

class ProfileUseCase implements BaseUseCase<void, UserModel> {
  final AuthRepository _authRepository;

  ProfileUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserModel>> execute(void input) async {
    return await _authRepository.getProfile();
  }
}

class ProfileEditColorUseCase implements BaseUseCase<ColorProfile, void> {
  final AuthRepository _authRepository;

  ProfileEditColorUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> execute(ColorProfile colorProfile) async {
    return await _authRepository.editColorProfile(colorProfile);
  }
}
