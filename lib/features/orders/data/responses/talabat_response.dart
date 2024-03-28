
import 'package:freezed_annotation/freezed_annotation.dart';
part 'talabat_response.g.dart';

@JsonSerializable()
class TalabatResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "balance")
  BalanceTalabatResponse? balance;

  @JsonKey(name: "orders")

  List<OrdersTalabatResponse>? orders;

  TalabatResponse({
      this.status, 
      this.message, 
      this.balance, 
      this.orders});

  TalabatResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    balance = json["balance"] != null ? BalanceTalabatResponse.fromJson(json["balance"]) : null;
    if (json["orders"] != null) {
      orders = [];
      json["orders"].forEach((v) {
        orders?.add(OrdersTalabatResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    if (balance != null) {
      map["balance"] = balance?.toJson();
    }
    if (orders != null) {
      map["orders"] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrdersTalabatResponse {
  int? id;
  String? orderNo;
  int? status;
  String? date;

  OrdersTalabatResponse({
      this.id, 
      this.orderNo, 
      this.status, 
      this.date});

  OrdersTalabatResponse.fromJson(dynamic json) {
    id = json["id"];
    orderNo = json["orderNo"];
    status = json["status"];
    date = json["date"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["orderNo"] = orderNo;
    map["status"] = status;
    map["date"] = date;
    return map;
  }

}

class BalanceTalabatResponse {
  int? totalDoler;
  int? totalLera;

  BalanceTalabatResponse({
      this.totalDoler, 
      this.totalLera});

  BalanceTalabatResponse.fromJson(dynamic json) {
    totalDoler = json["total_Doler"];
    totalLera = json["total_Lera"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total_Doler"] = totalDoler;
    map["total_Lera"] = totalLera;
    return map;
  }

}