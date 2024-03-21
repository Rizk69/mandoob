import 'package:json_annotation/json_annotation.dart';

part 'search_requests.g.dart';

@JsonSerializable()
class SearchLineRequest {
  @JsonKey(name: "date")
  final String date;

  SearchLineRequest(this.date);

  Map<String, dynamic> toJson() {
    return {
      'date': date,
    };
  }
}