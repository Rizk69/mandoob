import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/debts/data/responses/debt_invoice_trader_response.dart';
import 'package:mandoob/features/debts/domain/model/debt_invoice_trader_model.dart';

extension DebtInvoiceTraderMapper on DebtInvoiceTraderResponse? {
  DebtInvoiceTraderModel toDomain() {
    return DebtInvoiceTraderModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      data: this?.data?.toDomain(),
    );
  }
}

extension on DebtInvoiceTraderDataResponse? {
  DebtInvoiceTraderDataModel toDomain() {
    return DebtInvoiceTraderDataModel(
      id: this?.id ?? Constants.zero,
      traderName: this?.traderName ?? Constants.empty,
      traderPhone: this?.traderPhone ?? Constants.empty,
      date: this?.date ?? Constants.empty,
      invoiceNo: this?.invoiceNo ?? Constants.empty,
      debtPriceDoler: this?.debtPriceDoler ?? Constants.empty,
      debtPriceLera: this?.debtPriceLera ?? Constants.empty,
      payPriceDoler: this?.payPriceDoler ?? Constants.empty,
      payPriceLera: this?.payPriceLera ?? Constants.empty,
      restPriceDoler: this?.restPriceDoler ?? Constants.empty,
      restPriceLera: this?.restPriceLera ?? Constants.empty,
    );
  }
}
