import 'package:mandoob/app/constants.dart';
import 'package:mandoob/features/trafiic_lines/data/responses/traffic_line_response.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';

extension TrafficResponseMapper on TrafficResponse? {
  TrafficModel toDomain() {
    return TrafficModel(
        status: this?.status ?? false,
        message: this?.message ?? Constants.empty,
        data: this?.data?.map((data) => data.toDomain()).toList() ?? []);
  }
}

extension TrafficDataResponseMapper on TrafficDataResponse? {
  TrafficDataModel toDomain() {
    return TrafficDataModel(
      id: this?.id ?? Constants.zero,
      customerName: this?.customerName ?? Constants.empty,
      address: this?.address ?? Constants.empty,
      date: this?.date ?? Constants.empty,
      active: this?.active ?? Constants.zero,
      number: this?.number ?? Constants.zero,
    );
  }
}
