import 'package:mandoob/features/trafiic_lines/data/network/traffic_line_api.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';


abstract class RemoteTrafficLineDataSource {
  Future<TrafficResponse> getDelivaryLine();
}

class RemoteTrafficLinesDataSourceImpl extends RemoteTrafficLineDataSource {
  final TrafficLineServiceClient _appServiceClient;

  RemoteTrafficLinesDataSourceImpl(this._appServiceClient);

  @override
  Future<TrafficResponse> getDelivaryLine() {
    return _appServiceClient.getDelivaryLine();
  }


}
