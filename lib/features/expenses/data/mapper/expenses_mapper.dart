import 'package:mandoob/features/expenses/data/responses/reason_expenses_response.dart';
import 'package:mandoob/features/expenses/domain/model/reason_expenses_model.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';

extension ReasonExpensesResponseMapper on ReasonExpensesResponse? {
  ReasonExpensesModel toDomain() {
    return ReasonExpensesModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      reasonExpense:
          this?.reasonExpense?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension ReasonExpenseResponseMapper on ReasonExpenseResponse? {
  ReasonExpense toDomain() {
    return ReasonExpense(
      id: this?.id.orZero() ?? Constants.zero,
      nameAr: this?.nameAr.orEmpty() ?? Constants.empty,
      nameEn: this?.nameEn.orEmpty() ?? Constants.empty,
    );
  }
}
