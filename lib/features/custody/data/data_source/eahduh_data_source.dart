import 'package:mandoob/features/custody/data/network/eahduh_requests.dart';
import 'package:mandoob/features/custody/data/responses/cart_response.dart';
import 'package:mandoob/features/custody/data/responses/confirm_response.dart';
import 'package:mandoob/features/custody/data/responses/pay_partial_response.dart';

import '../network/eahduh_api.dart';
import '../responses/eahduh_response.dart';

abstract class RemoteEahduhDataSource {
  Future<EahduhResponse> getEahduhOrder();

  Future<void> addEahduhOrder({required int id});

  Future<void> deleteEahduhOrder({required int id});

  Future<CartResponse> getCart();


  Future<void> addProductToCart({required int productId});
  Future<void> deleteOneProductInCart({required int productId});
  Future<void> deleteAllProductInCart();

  Future<void> addCurrencyAndCount({required int product_id ,required  int currency_id ,required  num count});

  Future<ConfirmResponse> confirmInvoice({required ConfirmRequest confirmRequest});

  Future<PayPartialResponse> payPartialDept({required PayPartialDeptRequest partialDeptRequest});



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

  @override
  Future<void> addProductToCart({required int productId}) {
    return _appServiceClient.addProductToCart(productId);
  }

  @override
  Future<void> deleteAllProductInCart() {
    return _appServiceClient.deleteAllProductInCart();
  }

  @override
  Future<void> deleteOneProductInCart({required int productId}) {
    return _appServiceClient.deleteOneProductInCart(productId);
  }

  @override
  Future<void> addCurrencyAndCount({required int product_id, required int currency_id, required num count}) {
    return _appServiceClient.addCurrencyAndCount(product_id,currency_id,count);

  }

  @override
  Future<ConfirmResponse> confirmInvoice({required ConfirmRequest confirmRequest}) {
    return _appServiceClient.confirmInvoice(confirmRequest);

  }

  @override
  Future<PayPartialResponse> payPartialDept({required PayPartialDeptRequest partialDeptRequest}) {
    return _appServiceClient.payPartialDept(partialDeptRequest);
  }
}
