import 'package:mandoob/features/purchase/data/responses/add_purchase_responses.dart';
import 'package:mandoob/features/purchase/domain/model/add_purchase_model.dart';

extension AddPurchaseResponseMapper on AddPurchaseResponses? {
  AddPurchaseModel toDomain() {
    return AddPurchaseModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      sellPurchaseId: this?.sellPurchaseId ?? 0,
    );
  }
}
