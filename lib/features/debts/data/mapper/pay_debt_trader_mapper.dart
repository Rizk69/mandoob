import 'package:mandoob/features/debts/data/responses/pay_debt_trader_response.dart';
import 'package:mandoob/features/debts/domain/model/pay_debt_trader_model.dart';

extension PayDebtTraderResponseExtension on PayDebtTraderResponse? {
  PayDebtTraderModel toDomain() {
    return PayDebtTraderModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      invoiceId: this?.invoiceId ?? 0,
    );
  }
}
