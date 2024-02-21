import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/data/data_source/remote_data_source.dart';
import 'package:mandoob/data/mapper/login/login_mapper.dart';
import 'package:mandoob/data/mapper/register/register_mapper.dart';
import 'package:mandoob/data/network/error_handler.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/network_info.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/login/login_model.dart';
import 'package:mandoob/domain/model/register/register_model.dart';
import 'package:mandoob/domain/repository/repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';


class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    try {
      // its connected to internet, its safe to call API
      final response = await _remoteDataSource.login(loginRequest);
      if (response.returnValue == 0) {
        // success return data
        return Right(response.toDomain());
      } else {
        // failure --return business error
        return Left(
          Failure(
            ResponseCode.UNAUTHORIZED,
            response.returnString ?? LocaleKeys.UNAUTHORIZED.tr(),
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }


  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);

      if (response.returnValue == 1) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            response.returnValue ?? Constants.zero,
            response.returnString ?? Constants.empty,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }


}
