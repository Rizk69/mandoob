import 'package:mandoob/features/trafiic_lines/data/network/add_requests.dart';
import 'package:mandoob/features/trafiic_lines/data/network/search_requests.dart';
import 'package:mandoob/features/trafiic_lines/data/network/traffic_line_api.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';

abstract class RemoteTrafficLineDataSource {
  Future<TrafficResponse> getDelivaryLine();
  Future<void> deleteDelivaryLine({required int id});
  Future<void> closeDelivaryLine({required int id});
  Future<TrafficResponse> searchDelivaryLine({required SearchLineRequest searchLineRequest});

  Future<void> addDelivaryLine({required AddLineRequest addLineRequest});
}

class RemoteTrafficLinesDataSourceImpl extends RemoteTrafficLineDataSource {
  final TrafficLineServiceClient _appServiceClient;

  RemoteTrafficLinesDataSourceImpl(this._appServiceClient);

  @override
  Future<TrafficResponse> getDelivaryLine() {
    return _appServiceClient.getDelivaryLine();
  }

  @override
  Future<void> deleteDelivaryLine({required int id}) {
    return _appServiceClient.deleteDelivaryLine(id);
  }
  @override
  Future<void> closeDelivaryLine({required int id}) {
    return _appServiceClient.closeDelivaryLine(id);
  }

  @override
  Future<TrafficResponse> searchDelivaryLine({required SearchLineRequest searchLineRequest}) {
    return _appServiceClient.searchDelivaryLine(searchLineRequest);
  }

  @override
  Future<void> addDelivaryLine({required AddLineRequest addLineRequest}) {
    return _appServiceClient.addDelivaryLine(addLineRequest);

  }
}
