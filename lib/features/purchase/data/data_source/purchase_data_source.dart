
import 'package:mandoob/features/purchase/data/network/add_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/add_salse_purchase_request.dart';
import 'package:mandoob/features/purchase/data/network/purchase_api.dart';
import 'package:mandoob/features/purchase/data/responses/add_purchase_responses.dart';
import 'package:mandoob/features/purchase/data/responses/purchase_responses.dart';

abstract class RemotePurchaseDataSource {
  Future<PurchaseResponses> getPurchase();
  Future<AddPurchaseResponses> addPurchase(AddPurchaseRequest addPurchaseRequest);
  Future<AddPurchaseResponses> addSalsePurchase(AddSalsePurchaseRequest addSalsePurchaseRequest);
}

class RemotePurchaseDataSourceImpl extends RemotePurchaseDataSource {
  final PurchaseServiceClient _appServiceClient;

  RemotePurchaseDataSourceImpl(this._appServiceClient);

  @override
  Future<PurchaseResponses> getPurchase() {
    return _appServiceClient.getPurchase();
  }

  @override
  Future<AddPurchaseResponses> addPurchase(AddPurchaseRequest addPurchaseRequest) {
    return _appServiceClient.addPurchase(addPurchaseRequest);

  }

  @override
  Future<AddPurchaseResponses> addSalsePurchase(AddSalsePurchaseRequest addSalsePurchaseRequest) {
    return _appServiceClient.addSalsePurchase(addSalsePurchaseRequest);

  }
}
