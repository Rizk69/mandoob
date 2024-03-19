import 'package:mandoob/features/home/data/network/home_api.dart';
import 'package:mandoob/features/home/data/responses/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResponse> editShowPrice(int price);
  Future<HomeResponse> getHome();
}

class RemoteHomeDataSourceImpl extends RemoteHomeDataSource {
  final HomeServiceClient _homeServiceClient;

  RemoteHomeDataSourceImpl(this._homeServiceClient);

  @override
  Future<HomeResponse> editShowPrice(int price) {
    return _homeServiceClient.editShowPrice(price);
  }

  @override
  Future<HomeResponse> getHome() {
    return _homeServiceClient.getHome();
  }

}
