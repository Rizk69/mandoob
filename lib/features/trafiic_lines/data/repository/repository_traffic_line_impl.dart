import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/trafiic_lines/data/data_source/remote_traffic_line_data_source.dart';
import 'package:mandoob/features/trafiic_lines/data/mapper/traffic_line_mapper.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';
import 'package:mandoob/features/trafiic_lines/domain/repository/traffic_line_repository.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class RepositoryTrafficLineImpl extends Repository {
  final RemoteTrafficLineDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryTrafficLineImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, TrafficModel>> getDelivaryLine() async {
    try {
      final response = await _remoteDataSource.getDelivaryLine();
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

  @override
  Future<Either<Failure, void>> deleteDelivaryLine({required int id}) async {
    try {
      final response = await _remoteDataSource.deleteDelivaryLine(id: id);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
