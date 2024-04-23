import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/custody/data/responses/confirm_response.dart';
import 'package:mandoob/features/custody/domain/model/confirm_model.dart';



extension ConfirmResponseMapper on ConfirmResponse {
  ConfirmModel toDomain() {
    return ConfirmModel(
      status: status?? false,
      message: message.orEmpty(),
      invoiceId: invoiceId.orZero(),
      priceDoler: priceDoler.orEmpty(),
      priceLera: priceLera.orEmpty(),
    );
  }
}

