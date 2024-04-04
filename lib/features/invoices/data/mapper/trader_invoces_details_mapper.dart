import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/invoices/data/responses/trader_details_invoice_response.dart';
import 'package:mandoob/features/invoices/domain/model/trader_details_invoice_model.dart';

extension TraderDetailsInvoiceResponseMapper on TraderDetailsInvoiceResponse? {
  TraderDetailsInvoiceModel toDomain() {
    return TraderDetailsInvoiceModel(
      status: this?.status ?? false,
      message: this?.message ?? Constants.empty,
      data: this!.data.toDomain(),
      products: this?.products?.map((product) => product.toDomain()).toList() ?? [],
    );
  }
}

extension InvoiceDataResponseMapper on InvoiceDataResponse? {
  InvoiceData toDomain() {
    return InvoiceData(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? Constants.empty,
      priceDoler: this?.priceDoler ?? Constants.zero,
      priceLera: this?.priceLera ?? Constants.zero,
      customerName: this?.customerName ?? Constants.empty,
      date: this?.date ?? Constants.empty,
    );
  }
}

extension ProductResponseMapper on ProductResponse? {
  Product toDomain() {
    return Product(
      id: this?.id ?? 0,
      nameAr: this?.nameAr ?? Constants.empty,
      nameEn: this?.nameEn ?? Constants.empty,
      count: this?.count ?? Constants.zero,
      unitAr: this?.unitAr ?? Constants.empty,
      unitEn: this?.unitEn ?? Constants.empty,
      priceDoler: this?.priceDoler ?? Constants.zero,
      priceLera: this?.priceLera ?? Constants.zero,
      date: this?.date ?? Constants.empty,
    );
  }
}
