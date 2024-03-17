import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/model/login/login_model.dart';
import 'package:mandoob/features/auth/domain/model/profile/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<Failure, UserModel>> getProfile();

  Future<Either<Failure, void>> editColorProfile(ColorProfile colorProfile);
}
