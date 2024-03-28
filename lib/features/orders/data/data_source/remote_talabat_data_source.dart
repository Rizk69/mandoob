import 'package:mandoob/features/home/data/network/home_api.dart';
import 'package:mandoob/features/home/data/responses/home_response.dart';

import '../network/talabat_api.dart';
import '../responses/talabat_response.dart';

abstract class RemoteTalabatSource {
  Future<TalabatResponse> getPresentOrders();
  Future<TalabatResponse> getOldOrders();
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



}
