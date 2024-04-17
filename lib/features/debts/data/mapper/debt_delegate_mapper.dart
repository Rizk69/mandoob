import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/debts/data/responses/debt_delegate_response.dart';
import 'package:mandoob/features/debts/domain/model/debt_delegate_model.dart';



extension DebtTraderResponseMapper on DebtDelegateResponse? {
  DebtDelegateModel toDomain() {
    return DebtDelegateModel(
      status: this?.status ?? false,
      message: this?.message?.orEmpty()??Constants.empty,
      debts: this?.debts?.map((debt) => debt.toDomain()).toList() ?? [],
    );
  }
}




extension DebtDelegateMapper on DebtDelegateDataResponse {
  DebtDelegateDataModel toDomain() {
    return DebtDelegateDataModel(
      id: id?.orZero()??Constants.zero,
      debtPriceDoler: debtPriceDoler?.orZero()??Constants.zero,
      debtPriceLera: debtPriceLera?.orZero()??Constants.zero,
      date: date?.orEmpty()??Constants.empty,
      reasonExpensesNameAr: reasonExpensesNameAr?.orEmpty()??Constants.empty,
      reasonExpensesNameEn: reasonExpensesNameEn?.orEmpty()??Constants.empty,
    );
  }
}
