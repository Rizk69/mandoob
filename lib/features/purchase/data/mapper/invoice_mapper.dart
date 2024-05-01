import 'package:mandoob/features/purchase/data/responses/invoice_responses.dart';
import 'package:mandoob/features/purchase/domain/model/invoice_model.dart';

extension InvoicePurchaseResponsesMapper on InvoicePurchaseResponses? {
  InvoicePurchaseModel toDomain() {
    return InvoicePurchaseModel(
        status: this?.status ?? false,
        message: this?.message ?? '',
        invoice: this?.invoice?.toDomain() ??
            InvoiceModel(
              id: 0,
              productName: '',
              count: 0,
              priceDoler: '',
              priceLera: '',
              payPriceDoler: '',
              payPriceLera: '',
              restPriceDoler: '',
              restPriceLera: '',
              customerName: '',
              customerPhone: '',
              payAr: '',
              payEn: '',
              date: '',
            ));
  }
}

extension InvoiceResponsesMapper on InvoiceResponses? {
  InvoiceModel toDomain() {
    return InvoiceModel(
        id: this?.id ?? 0,
        productName: this?.productName ?? '',
        count: this?.count ?? 0,
        priceDoler: this?.priceDoler ?? '',
        priceLera: this?.priceLera ?? '',
        payPriceDoler: this?.payPriceDoler ?? '',
        payPriceLera: this?.payPriceLera ?? '',
        restPriceDoler: this?.restPriceDoler ?? '',
        restPriceLera: this?.restPriceLera ?? '',
        customerName: this?.customerName ?? '',
        customerPhone: this?.customerPhone ?? '',
        payAr: this?.payAr ?? '',
        payEn: this?.payEn ?? '',
        date: this?.date ?? '');
  }
}
