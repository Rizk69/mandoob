import 'package:mandoob/features/purchase/data/responses/purchase_responses.dart';
import 'package:mandoob/features/purchase/domain/model/purchase_model.dart';

extension PurchaseResponsesMapper on PurchaseResponses? {
  PurchaseModel toDomain() {
    return PurchaseModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      purchaseProductModel:
          this?.purchaseProductResponse?.map((e) => e.toDomain()).toList() ??
              [],
    );
  }
}

extension PurchaseProductResponseMapper on PurchaseProductResponse? {
  PurchaseProductModel toDomain() {
    return PurchaseProductModel(
      id: this?.id ?? 0,
      productName: this?.productName ?? '',
      count: this?.count ?? 0,
      unit: this?.unit ?? '',
      purchasePrice: this?.purchasePrice ?? 0,
      currencyAr: this?.currencyAr ?? '',
      currencyEn: this?.currencyEn ?? '',
    );
  }
}
