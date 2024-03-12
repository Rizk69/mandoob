import 'package:dartz/dartz.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/login/login_model.dart';

import '../../data/responses/profile/user_response.dart';
import '../model/user/UserModel.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, UserModel>> getProfile();
}
