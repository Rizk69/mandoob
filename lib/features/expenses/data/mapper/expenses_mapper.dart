import 'package:mandoob/features/expenses/data/responses/expenses_response.dart';
import 'package:mandoob/features/expenses/domain/model/expenses_model.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';

extension ExpensesResponseMapper on ExpensesResponse? {
  ExpensesModel toDomain() {
    return ExpensesModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      expenses: this?.expenses?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension ExpenseResponseMapper on ExpenseDataResponse? {
  ExpenseDataModel toDomain() {
    return ExpenseDataModel(
      id: this?.id.orZero()?? Constants.zero,
      reasonExpenseAr: this?.reasonExpenseAr.orEmpty() ?? Constants.empty,
      reasonExpenseEn: this?.reasonExpenseEn.orEmpty() ?? Constants.empty,
      price: this?.price.orZero()?? Constants.zero,
      count:this?.count.orZero()?? Constants.zero,
      date: this?.date.orEmpty() ?? Constants.empty,
      statusAr: this?.statusAr.orEmpty() ?? Constants.empty,
      statusEn: this?.statusEn.orEmpty() ?? Constants.empty,
    );
  }
}
