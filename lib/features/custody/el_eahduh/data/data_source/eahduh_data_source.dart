import 'package:mandoob/features/trafiic_lines/data/network/traffic_line_api.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';

import '../network/eahduh_api.dart';
import '../responses/eahduh_response.dart';

abstract class RemoteEahduhDataSource {
  Future<EahduhResponse> getEahduhOrder();
}

class RemoteEahduhDataSourceImpl extends RemoteEahduhDataSource {
  final EahduhServiceClient _appServiceClient;

  RemoteEahduhDataSourceImpl(this._appServiceClient);

  @override
  Future<EahduhResponse> getEahduhOrder() {
    return _appServiceClient.getEahduhOrder();
  }
}
