import 'package:json_annotation/json_annotation.dart';

part 'add_requests.g.dart';

@JsonSerializable()
class AddLineRequest {
  @JsonKey(name: "customer_id")
  final String customer_id;

  @JsonKey(name: "date")
  final String date;

  AddLineRequest(this.customer_id ,this.date);

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customer_id,
      'date': date,
    };
  }
}