import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/login/login_model.dart';
import 'package:mandoob/domain/model/profile/user_model.dart';


abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);


  Future<Either<Failure, UserModel>> getProfile();
  Future<Either<Failure, UserModel>> getDelivaryLine();
  Future<Either<Failure, void>> editColorProfile(ColorProfile colorProfile);
}
