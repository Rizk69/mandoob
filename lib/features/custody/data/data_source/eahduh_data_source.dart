import 'package:mandoob/features/custody/data/responses/cart_response.dart';

import '../network/eahduh_api.dart';
import '../responses/eahduh_response.dart';

abstract class RemoteEahduhDataSource {
  Future<EahduhResponse> getEahduhOrder();

  Future<void> addEahduhOrder({required int id});

  Future<void> deleteEahduhOrder({required int id});

  Future<CartResponse> getCart();
}

class RemoteEahduhDataSourceImpl extends RemoteEahduhDataSource {
  final EahduhServiceClient _appServiceClient;

  RemoteEahduhDataSourceImpl(this._appServiceClient);

  @override
  Future<EahduhResponse> getEahduhOrder() {
    return _appServiceClient.getEahduhOrder();
  }

  @override
  Future<void> addEahduhOrder({required int id}) {
    return _appServiceClient.addEahduhOrder(id);
  }

  @override
  Future<void> deleteEahduhOrder({required int id}) {
    return _appServiceClient.deleteEahduhOrder(id);
  }

  @override
  Future<CartResponse> getCart() {
    return _appServiceClient.getCart();
  }
}
