import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/confirm_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/pay_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/purchase_api.dart';
import 'package:mandoob/features/purchase/data/responses/add_purchase_responses.dart';
import 'package:mandoob/features/purchase/data/responses/invoice_responses.dart';
import 'package:mandoob/features/purchase/data/responses/message_responses.dart';
import 'package:mandoob/features/purchase/data/responses/purchase_responses.dart';

abstract class RemotePurchaseDataSource {
  Future<PurchaseResponses> getPurchase();
  Future<InvoicePurchaseResponses> getInvoicePurchase(int sellPurchaseId);
  Future<MessageResponses> addPurchase(AddPurchaseRequest addPurchaseRequest);
  Future<AddPurchaseResponses> addSalsePurchase(
      AddSalsePurchaseRequest addSalsePurchaseRequest);
  Future<AddPurchaseResponses> confirmPurchase(
      ConfirmPurchaseRequest confirmPurchaseRequest);
  Future<MessageResponses> payPurchase(PayPurchaseRequest payPurchaseRequest);
}

class RemotePurchaseDataSourceImpl extends RemotePurchaseDataSource {
  final PurchaseServiceClient _appServiceClient;

  RemotePurchaseDataSourceImpl(this._appServiceClient);

  @override
  Future<PurchaseResponses> getPurchase() {
    return _appServiceClient.getPurchase();
  }

  @override
  Future<MessageResponses> addPurchase(AddPurchaseRequest addPurchaseRequest) {
    return _appServiceClient.addPurchase(addPurchaseRequest);
  }

  @override
  Future<AddPurchaseResponses> addSalsePurchase(
      AddSalsePurchaseRequest addSalsePurchaseRequest) {
    return _appServiceClient.addSalsePurchase(addSalsePurchaseRequest);
  }

  @override
  Future<AddPurchaseResponses> confirmPurchase(
      ConfirmPurchaseRequest confirmPurchaseRequest) {
    return _appServiceClient.confirmPurchase(confirmPurchaseRequest);
  }

  @override
  Future<InvoicePurchaseResponses> getInvoicePurchase(int sellPurchaseId) {
    return _appServiceClient.getInvoicePurchase(sellPurchaseId);
  }

  @override
  Future<MessageResponses> payPurchase(PayPurchaseRequest payPurchaseRequest) {
    return _appServiceClient.payPurchase(payPurchaseRequest);
  }
}
