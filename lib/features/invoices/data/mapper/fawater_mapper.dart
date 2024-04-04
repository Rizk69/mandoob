import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/invoices/data/responses/supplier_invoice_response.dart';
import 'package:mandoob/features/invoices/data/responses/trader_invoice_response.dart';
import 'package:mandoob/features/invoices/domain/model/supplier_invoice_model.dart';
import 'package:mandoob/features/invoices/domain/model/trader_invoice_model.dart';

extension FawaterTraderInvoiceResponseMapper on TraderInvoiceResponse? {
  TraderInvoiceModel toDomain() {
    return TraderInvoiceModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      data: this?.data?.map((response) => response.toDomain()).toList() ?? [],
    );
  }
}

extension TraderInvoiceDataResponseMapper on TraderInvoiceDataResponse? {
  TraderInvoiceDataModel toDomain() {
    return TraderInvoiceDataModel(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? '',
      priceDoler: int.tryParse(this?.priceDoler ?? '') ?? Constants.zero,
      priceLera: int.tryParse(this?.priceLera ?? '') ?? Constants.zero,
      customerName: this?.customerName ?? '',
      date: this?.date ?? '',
    );
  }
}
extension SupplierInvoiceResponseMapper on SupplierInvoiceResponse? {
  SupplierInvoiceModel toDomain() {
    return SupplierInvoiceModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
      data: this?.data?.toDomain() ?? SupplierInvoiceDataModel(
        totalDoler: 0,
        totalLera: 0,
        date: '',
      ),
    );
  }
}

extension DataSupplierInvoiceResponseMapper on DataSupplierInvoiceResponse? {
  SupplierInvoiceDataModel toDomain() {
    return SupplierInvoiceDataModel(
      totalDoler: this?.totalDoler?.toInt() ?? 0,
      totalLera: this?.totalLera?.toInt() ?? 0,
      date: this?.date ?? '',
    );
  }
}

