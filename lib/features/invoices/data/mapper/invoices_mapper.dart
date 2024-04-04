import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/features/invoices/data/responses/supplier_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_invoice_response.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';

extension FawaterTraderInvoiceResponseMapper on TraderInvoiceResponse? {
  TraderInvoiceModel toDomain() {
    return TraderInvoiceModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      data: this?.data?.map((response) => response.toDomain()).toList() ?? [],
    );
  }
}

extension TraderInvoiceDataResponseMapper on TraderInvoiceDataResponse? {
  TraderInvoiceDataModel toDomain() {
    return TraderInvoiceDataModel(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo.orEmpty() ?? Constants.empty,
      priceDoler: this?.priceDoler.orZero()?? Constants.zero,
      priceLera: this?.priceLera.orZero()  ?? Constants.zero,
      customerName: this?.customerName.orEmpty() ?? Constants.empty,
      date: this?.date.orEmpty() ?? Constants.empty,
    );
  }
}
extension SupplierInvoiceResponseMapper on SupplierInvoiceResponse? {
  SupplierInvoiceModel toDomain() {
    return SupplierInvoiceModel(
      status: this?.status ?? false,
      message: this?.message.orEmpty() ?? Constants.empty,
      data: this?.data?.toDomain() ?? SupplierInvoiceDataModel(
        totalDoler: Constants.zero,
        totalLera: Constants.zero,
        date: Constants.empty,
      ),
    );
  }
}

extension DataSupplierInvoiceResponseMapper on DataSupplierInvoiceResponse? {
  SupplierInvoiceDataModel toDomain() {
    return SupplierInvoiceDataModel(
      totalDoler: this?.totalDoler?.orZero() ?? Constants.zero,
      totalLera: this?.totalLera?.orZero() ?? Constants.zero,
      date: this?.date.orEmpty() ?? Constants.empty,
    );
  }
}

