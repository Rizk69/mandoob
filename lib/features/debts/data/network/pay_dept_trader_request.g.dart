// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_dept_trader_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayDeptTraderRequest _$PayDeptTraderRequestFromJson(
        Map<String, dynamic> json) =>
    PayDeptTraderRequest(
      traderId: json['trader_id'] as String?,
      price: json['price'] as String?,
      currencyId: json['currency_id'] as String?,
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$PayDeptTraderRequestToJson(
        PayDeptTraderRequest instance) =>
    <String, dynamic>{
      'trader_id': instance.traderId,
      'price': instance.price,
      'currency_id': instance.currencyId,
      'due_date': instance.dueDate,
    };
