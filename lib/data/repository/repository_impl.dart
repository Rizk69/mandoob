import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/data/data_source/remote_data_source.dart';
import 'package:mandoob/data/network/error_handler.dart';
import 'package:mandoob/data/network/failure.dart';
import 'package:mandoob/data/network/network_info.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/repository/repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

import '../responses/login/login_response.dart';


class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      if (response != null) {
        return Right(response);
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
