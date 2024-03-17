import 'package:dartz/dartz.dart';
import 'package:mandoob/core/base_usecase.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/model/login/login_model.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';


class LoginUseCase implements BaseUseCase<LoginRequest, LoginModel> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, LoginModel>> execute(LoginRequest loginRequest) async {
    return await _authRepository.login(loginRequest);
  }
}
