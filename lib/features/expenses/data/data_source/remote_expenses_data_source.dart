import 'package:mandoob/features/expenses/data/network/expenses_api.dart';
import 'package:mandoob/features/expenses/data/responses/addExpenses_requests.dart';
import 'package:mandoob/features/expenses/data/responses/reason_expenses_response.dart';


abstract class RemoteExpensesDataSource {
  Future<ReasonExpensesResponse> getExpensesReasons();
  Future<ReasonExpensesResponse> addExpensesReasons(AddExpensesRequests addExpensesRequests);

}

class RemoteExpensesDataSourceImpl extends RemoteExpensesDataSource {
  final ExpensesServiceClient _expensesServiceClient;

  RemoteExpensesDataSourceImpl(this._expensesServiceClient);

  @override
  Future<ReasonExpensesResponse> getExpensesReasons() {
    return _expensesServiceClient.getExpensesReasons();
  }

  @override
  Future<ReasonExpensesResponse> addExpensesReasons(AddExpensesRequests addExpensesRequests) {
    return _expensesServiceClient.addExpensesReasons(addExpensesRequests);

  }


}
