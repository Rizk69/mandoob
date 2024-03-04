import 'package:dartz/dartz.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/login/login_model.dart';
import 'package:mandoob/domain/model/register/register_model.dart';

import '../../data/responses/login/login_response.dart';

abstract class Repository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest);

}
