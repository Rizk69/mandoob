
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/debts/data/responses/debt_trader_response.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';

extension DebtTraderResponseMapper on DebtTraderResponse? {
  DeptTraderModel toDomain() {
    return DeptTraderModel(
      status: this?.status ?? false,
      message: this?.message?.orEmpty()??Constants.empty,
      debts: this?.debts?.map((debt) => debt.toDomain()).toList() ?? [],
    );
  }
}

extension DebtDetailResponseMapper on DebtDetailResponse? {
  DebtDetail toDomain() {
    return DebtDetail(
      id: this?.id?.orZero()??Constants.zero,
      traderName: this?.traderName?.orEmpty()??Constants.empty,
      debtDoler: this?.debtDoler?.orEmpty()??Constants.empty,
      debtLera: this?.debtLera?.orEmpty()??Constants.empty,
      lastDate: this?.lastDate?.orEmpty()??Constants.empty,
      dueDate: this?.dueDate?.orEmpty()??Constants.empty,
    );
  }
}
