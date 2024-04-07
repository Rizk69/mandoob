import 'package:dartz/dartz.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/core/netowork_core/failure.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/expenses/data/data_source/remote_expenses_data_source.dart';
import 'package:mandoob/features/expenses/data/mapper/expenses_mapper.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/features/expenses/domain/repository/expenses_repository.dart';

class ExpensesRepositoryImpl extends ExpensesRepository {
  final RemoteExpensesDataSource _remoteExpensesDataSource;
  final NetworkInfo _networkInfo;

  ExpensesRepositoryImpl(this._remoteExpensesDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ReasonExpensesModel>> getExpensesReasons() async {

    try {
      final response = await _remoteExpensesDataSource.getExpensesReasons();

      if (response.status == true) {
        print(response.status);
        return Right(response.toDomain());
      } else {
        return Left(Failure(
          ResponseCode.NOT_FOUND,
          response.message.orEmpty(),
        ));
      }

    } catch (error) {
      print("catch");
      return Left(ErrorHandler.handle(error).failure);
    }
  }


}
