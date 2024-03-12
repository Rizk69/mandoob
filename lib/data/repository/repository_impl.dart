import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/data/data_source/remote_data_source.dart';
import 'package:mandoob/data/mapper/login/login_mapper.dart';
import 'package:mandoob/data/mapper/profile/profile_mapper.dart';
import 'package:mandoob/data/network/error_handler.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/network_info.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/login/login_model.dart';
import 'package:mandoob/domain/model/profile/user_model.dart';
import 'package:mandoob/domain/repository/repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';


class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == true) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          LocaleKeys.UNAUTHORIZED.tr(),
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final response = await _remoteDataSource.getProfile();
      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.UNAUTHORIZED,
          LocaleKeys.UNAUTHORIZED.tr(),
        ));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
