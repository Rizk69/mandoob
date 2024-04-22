import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import '../../domain/model/invoices_model.dart';
import '../responses/invoices_response.dart';

extension InvoicesResponseMapper on InvoicesResponse? {
  InvoicesModel toDomain() {
    return InvoicesModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      invoice: this?.invoice?.toDomain(),
    );
  }
}

extension InvoiceDataMapper on InvoiceDataResponse? {
  InvoiceModel toDomain() {
    return InvoiceModel(
      id: this?.id.orZero() ?? Constants.zero,
      invoiceNo: this?.invoiceNo.orEmpty() ?? Constants.empty,
      priceDoler: this?.priceDoler.orZero() ?? Constants.zero,
      priceLera: this?.priceLera.orZero() ?? Constants.zero,
      payPriceDoler: this?.payPriceDoler.orZero() ?? Constants.zero,
      payPriceLera: this?.payPriceLera.orZero() ?? Constants.zero,
      restPriceDoler: this?.restPriceDoler.orZero() ?? Constants.zero,
      restPriceLera: this?.restPriceLera.orZero() ?? Constants.zero,
      customerName: this?.customerName.orEmpty() ?? Constants.empty,
      customerPhone: this?.customerPhone.orEmpty() ?? Constants.empty,
      paymentMethodAr: this?.paymentMethodAr.orEmpty() ?? Constants.empty,
      paymentMethodEn: this?.paymentMethodEn.orEmpty() ?? Constants.empty,
      date: this?.date.orEmpty() ?? Constants.empty,
      products: this?.products.toDomain() ?? [],
    );
  }
}

extension ProductDataListMapper on List<ProductDataResponse>? {
  List<ProductModel> toDomain() {
    return this?.map((productData) => productData.toDomain()).toList() ?? [];
  }
}

extension ProductDataMapper on ProductDataResponse {
  ProductModel toDomain() {
    return ProductModel(
      id: id.orZero(),
      nameAr: nameAr.orEmpty(),
      nameEn: nameEn.orEmpty(),
      count: count.orZero(),
      unitAr: unitAr.orEmpty(),
      unitEn: unitEn.orEmpty(),
      priceDoler: priceDoler.orZero(),
      priceLera: priceLera.orZero(),
      date: date.orEmpty(),
    );
  }
}
