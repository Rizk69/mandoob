import 'package:dartz/dartz.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/model/login/login_model.dart';
import 'package:mandoob/features/auth/domain/model/profile/user_model.dart';
import 'package:mandoob/features/home/domain/model/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> editShowPrice(int price);
  Future<Either<Failure, HomeModel>> getHome();
}
