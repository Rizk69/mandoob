import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/data/responses/add_order_response.dart';

import '../network/talabat_api.dart';
import '../responses/company_products_response.dart';
import '../responses/talabat_response.dart';

abstract class RemoteTalabatSource {
  Future<TalabatResponse> getPresentOrders();

  Future<TalabatResponse> getOldOrders();

  Future<CompanyProductsResponse> getCompanyProducts();

  Future<AddOrderResponse> addTalabat(List<AddOrderRequest> orders);

  Future<OrderResponse> decreaseOrder(OrderRequest orderRequest);

  Future<OrderResponse> increaseOrder(OrderRequest orderRequest);

  Future<OrderResponse> deleteOrder(OrderRequest orderRequest);
}

class TalabatSourceImpl extends RemoteTalabatSource {
  final TalabatServiceClient _talabatServiceClient;

  TalabatSourceImpl(this._talabatServiceClient);

  @override
  Future<TalabatResponse> getOldOrders() {
    return _talabatServiceClient.getOldOrders();
  }

  @override
  Future<TalabatResponse> getPresentOrders() {
    return _talabatServiceClient.getPresentOrders();
  }

  @override
  Future<CompanyProductsResponse> getCompanyProducts() {
    return _talabatServiceClient.getCompanyProducts();
  }

  @override
  Future<AddOrderResponse> addTalabat(List<AddOrderRequest> orders) {
    return _talabatServiceClient.addTalabat(orders);
  }

  @override
  Future<OrderResponse> decreaseOrder(OrderRequest orderRequest) {
    return _talabatServiceClient.decreaseOrder(orderRequest);
  }

  @override
  Future<OrderResponse> deleteOrder(OrderRequest orderRequest) {
    return _talabatServiceClient.deleteOrder(orderRequest);
  }

  @override
  Future<OrderResponse> increaseOrder(OrderRequest orderRequest) {
    return _talabatServiceClient.increaseOrder(orderRequest);
  }
}
