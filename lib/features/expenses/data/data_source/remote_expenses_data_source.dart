import 'package:mandoob/features/auth/data/network/auth_api.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/data/responses/login/login_response.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';
import 'package:mandoob/features/expenses/data/network/expenses_api.dart';
import 'package:mandoob/features/expenses/data/responses/reason_expenses_response.dart';


abstract class RemoteExpensesDataSource {
  Future<ReasonExpensesResponse> getExpensesReasons();

}

class RemoteExpensesDataSourceImpl extends RemoteExpensesDataSource {
  final ExpensesServiceClient _expensesServiceClient;

  RemoteExpensesDataSourceImpl(this._expensesServiceClient);

  @override
  Future<ReasonExpensesResponse> getExpensesReasons() {
    return _expensesServiceClient.getExpensesReasons();
  }


}
