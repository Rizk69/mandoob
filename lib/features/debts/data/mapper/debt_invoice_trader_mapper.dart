import 'package:mandoob/features/debts/data/responses/debt_invoice_trader_response.dart';
import 'package:mandoob/features/debts/domain/model/debt_invoice_trader_model.dart';

extension DebtInvoiceTraderMapper on DebtInvoiceTraderResponse? {
  DebtInvoiceTraderModel toDomain() {
    return DebtInvoiceTraderModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      data: this?.data?.map((item) => item.toDomain()).toList() ?? [],
    );
  }
}

extension on DebtInvoiceTraderDataResponse? {
  DebtInvoiceTraderDataModel toDomain() {
    return DebtInvoiceTraderDataModel(
      id: this?.id ?? 0,
      traderName: this?.traderName ?? '',
      traderPhone: this?.traderPhone ?? '',
      date: this?.date ?? '',
      invoiceNo: this?.invoiceNo ?? '',
      debtPriceDoler: this?.debtPriceDoler ?? 0,
      debtPriceLera: this?.debtPriceLera ?? 0,
      payPriceDoler: this?.payPriceDoler ?? 0,
      payPriceLera: this?.payPriceLera ?? 0,
      restPriceDoler: this?.restPriceDoler ?? 0,
      restPriceLera: this?.restPriceLera ?? 0,
    );
  }
}
