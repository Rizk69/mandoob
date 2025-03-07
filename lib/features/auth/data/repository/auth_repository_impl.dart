import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:mandoob/features/auth/data/mapper/login/login_mapper.dart';
import 'package:mandoob/features/auth/data/mapper/profile/profile_mapper.dart';
import 'package:mandoob/features/auth/domain/model/login/login_model.dart';
import 'package:mandoob/features/auth/domain/model/profile/user_model.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final NetworkInfo _networkInfo;
  final LocalDataSource _localDataSource;

  AuthRepositoryImpl(
      this._remoteAuthDataSource, this._networkInfo, this._localDataSource);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteAuthDataSource.login(loginRequest);
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
      final response = await _localDataSource.getProfileData();
      print("data in Cache");
      return Right(response.toDomain());
    } catch (error) {
      print("data in net");
      if (await _networkInfo.isConnect) {
        try {
          final response = await _remoteAuthDataSource.getProfile();
          if (response.status == true) {
            print(response.status);
            await _localDataSource.saveProfileDataToCache(response);

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
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> editColorProfile(
      ColorProfile colorProfile) async {
    try {
      final response =
          await _remoteAuthDataSource.editColorProfile(colorProfile);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
